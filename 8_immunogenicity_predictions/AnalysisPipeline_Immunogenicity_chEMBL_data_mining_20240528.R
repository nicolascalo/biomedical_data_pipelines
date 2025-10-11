list.of.packages <-
  c(
    "janitor",
    "tidyverse",
    "conflicted",
    "httr",
    "jsonlite",
    "future",
    "future.apply"
  )

new.packages <-
  list.of.packages[!(list.of.packages %in% installed.packages()[, "Package"])] # creates a list of the packages not currently installed


if (length(new.packages)) {
  install.packages(new.packages) # checks whether packages are missing and installs them
}


# Start ############




# library loading


lapply(list.of.packages, library, character.only = TRUE)




conflict_prefer("filter", "dplyr")
conflict_prefer("setdiff", "base")
conflicts_prefer(dplyr::select)
conflicts_prefer(base::setdiff)
conflicts_prefer(base::intersect)
progressr::handlers(global = TRUE)


"chembl_ProtClass" %>% message()



## chembl phase 3&4_biotherapeutics ##############

{
  path <- "https://www.ebi.ac.uk/chembl/api/data/molecule?format=json&biotherapeutic__isnull=false&max_phase__in=3,4"

  request <- GET(url = paste0(path))

  response <-
    httr::content(request, as = "text", encoding = "UTF-8")



  response

  molecule <-
    fromJSON(response, flatten = TRUE) %>%
    list_flatten()


  total_items <-
    molecule$page_meta_total_count



  paste0("chembl phase 3&4_biotherapeutics") %>% message()
  paste0(path) %>% message()
  paste0("Total entry to retrieve: ", total_items) %>% message()
  paste0("Starting retieval (this will take time)") %>% message()
  paste0("") %>% message()

  chembl_phase_34_biotherapeutics_list <-
    1:((total_items)) %>%
    sort(decreasing = TRUE) %>%
    future_lapply(function(id) {
      paste0("entry ", id, " being processed") %>% message()



      path <- paste0("https://www.ebi.ac.uk/chembl/api/data/molecule?format=json&biotherapeutic__isnull=false&max_phase__in=3,4&limit=", 1, "&offset=", id - 1)


      request <- GET(url = paste0(path))

      response <-
        httr::content(request, as = "text", encoding = "UTF-8")



      molecule <-
        fromJSON(response, flatten = TRUE) %>%
        list_flatten()


      molecule_tibble <-
        molecule$molecule %>%
        as_tibble() %>%
        select(-any_of(c(
          "cross_references",
          "molecule_synonyms",
          "atc_classifications"
        ))) %>%
        unnest(c(biotherapeutic.biocomponents), names_sep = "_") %>%
        mutate(across(everything(), as.character))
    })

  chembl_phase_34_biotherapeutics <-
    chembl_phase_34_biotherapeutics_list %>%
    do.call(bind_rows, .)




  rm(request)
  rm(molecule)
}


paste0("chembl phase 3&4_biotherapeutics retrieval over") %>% message()
paste0("") %>% message()



### chembl_phase_withdrawn_biotherapeutics ##############

{
  path <- "https://www.ebi.ac.uk/chembl/api/data/molecule?format=json&biotherapeutic__isnull=false&withdrawn_flag=True"

  request <- GET(url = paste0(path))

  response <-
    httr::content(request, as = "text", encoding = "UTF-8")

  response

  molecule <-
    fromJSON(response, flatten = TRUE) %>%
    list_flatten()


  total_items <-
    molecule$page_meta_total_count


  paste0("chembl_phase_withdrawn_biotherapeutics") %>% message()
  paste0(path) %>% message()
  paste0("Total entry to retrieve: ", total_items) %>% message()
  paste0("Starting retieval (this will take time)") %>% message()
  paste0("") %>% message()

  chembl_phase_withdrawn_biotherapeutics <-
    1:((total_items)) %>%
    sort(decreasing = TRUE) %>%
    future_lapply(function(id) {
      id %>% message()

      path <- paste0("https://www.ebi.ac.uk/chembl/api/data/molecule?format=json&biotherapeutic__isnull=false&withdrawn_flag=True&limit=", 1, "&offset=", id - 1)


      request <- GET(url = paste0(path))

      response <-
        httr::content(request, as = "text", encoding = "UTF-8")

      response

      molecule <-
        fromJSON(response, flatten = TRUE) %>%
        list_flatten()


      molecule_tibble <-
        molecule$molecule %>%
        as_tibble() %>%
        select(-any_of(c(
          "cross_references",
          "molecule_synonyms",
          "atc_classifications"
        ))) %>%
        unnest(c(biotherapeutic.biocomponents), names_sep = "_") %>%
        mutate(across(everything(), as.character))
    }) %>%
    do.call(bind_rows, .)
}


paste0("chembl_phase_withdrawn_biotherapeutics retrieval over") %>% message()
paste0("") %>% message()




paste0("Starting data merging and processing") %>% message()


chembl_phase_34_biotherapeutics_cleaned <-
  chembl_phase_34_biotherapeutics %>%
  clean_names() %>%
  mutate(biotherapeutic_biocomponents_component_type = biotherapeutic_biocomponents_component_type %>% tolower()) %>%
  group_by(across(everything())) %>%
  ungroup(biotherapeutic_biocomponents_component_id, biotherapeutic_biocomponents_description) %>%
  summarise(
    biotherapeutic_biocomponents_description_list = biotherapeutic_biocomponents_description %>% setdiff(NA) %>% paste0(collapse = ";"),
    biotherapeutic_biocomponents_component_id_list = biotherapeutic_biocomponents_component_id %>% setdiff(NA) %>% paste0(collapse = "-")
  ) %>%
  filter(biotherapeutic_biocomponents_component_type != "nucleic acid") %>%
  ungroup()


chembl_phase_34_biotherapeutics_cleaned_for_fasta <-
  chembl_phase_34_biotherapeutics_cleaned %>%
  select(
    pref_name,
    biotherapeutic_biocomponents_component_id_list,
    biotherapeutic_biocomponents_description_list,
    biotherapeutic_biocomponents_sequence
  ) %>%
  distinct() %>%
  filter(!biotherapeutic_biocomponents_sequence %>% str_detect("X")) %>%
  filter(!biotherapeutic_biocomponents_sequence %>% str_detect("[0-9]")) %>%
  select(pref_name, biotherapeutic_biocomponents_component_id_list, biotherapeutic_biocomponents_sequence) %>%
  distinct()


chembl_phase_34_biotherapeutics_cleaned <-
  chembl_phase_34_biotherapeutics_cleaned %>%
  mutate(biotherapeutic_category = case_when(
    usan_substem %>% str_detect("-glutide") ~ "GLP analogs",
    usan_stem == "-tide" ~ "Peptide",
    biotherapeutic_description %>% str_detect("chimeric") ~ "Chimeric",
    biotherapeutic_description %>% str_detect("porcine") ~ "Porcine",
    biotherapeutic_description %>% str_detect("bovine") ~ "Bovine",
    biotherapeutic_description %>% str_detect("human mab") ~ "Homo sapiens",
    biotherapeutic_description %>% str_detect("humanized mab") ~ "Humanized",
    biotherapeutic_description %>% str_detect("mouse Fab") ~ "Mus musculus",
    biotherapeutic_description %>% str_detect("mouse mab") ~ "Mus musculus",
    biotherapeutic_description %>% str_detect("mouse mab") ~ "Mus musculus",
    usan_stem == "-tide" ~ "Peptide",
    usan_stem == "-tide" ~ "Peptide",
    pref_name %>% str_detect("INSULIN") ~ "Insulins",
    TRUE ~ NA
  ))



dir.create("2_rawdata_fasta_indiv")
dir.create("0_reference_prots")


chembl_phase_34_biotherapeutics_cleaned_for_fasta %>%
  transpose() %>%
  lapply(function(sequence_to_process) {
    paste0(">", sequence_to_process$biotherapeutic_biocomponents_component_id_list) %>%
      write_lines(
        file = paste0(
          "./2_rawdata_fasta_indiv/chembl_phase_34_biotherapeutics_",
          sequence_to_process$pref_name %>% str_replace_all(" ", "_"),
          "_",
          sequence_to_process$biotherapeutic_biocomponents_component_id_list %>% str_replace_all(" ", "_"),
          ".fasta"
        )
      )


    paste0(sequence_to_process$biotherapeutic_biocomponents_sequence) %>%
      write_lines(
        file = paste0(
          "./2_rawdata_fasta_indiv/chembl_phase_34_biotherapeutics_",
          sequence_to_process$pref_name %>% str_replace_all(" ", "_"),
          "_",
          sequence_to_process$biotherapeutic_biocomponents_component_id_list %>% str_replace_all(" ", "_"),
          ".fasta"
        ),
        append = TRUE
      )
  })



IMGT_mAb_DB_results <-
  read_tsv("0_reference_prots/IMGT_mAb_DB_result_20251011.txt") %>%
  clean_names() %>%
  rename(
    "IMGT_mAb_DB_species" = species,
    "pref_name" = inn
  )

chembl_phase_34_biotherapeutics_cleaned_categorized <-
  chembl_phase_34_biotherapeutics_cleaned %>%
  select(
    pref_name,
    biotherapeutic_biocomponents_component_type,
    usan_stem,
    usan_stem_definition,
    usan_substem,
    biotherapeutic_biocomponents_organism,
    biotherapeutic_description,
    biotherapeutic_biocomponents_component_id_list,
    biotherapeutic_biocomponents_organism,
    biotherapeutic_category
  ) %>%
  distinct() %>%
  left_join(IMGT_mAb_DB_results %>% select(pref_name, IMGT_mAb_DB_species) %>% mutate(pref_name = pref_name %>% toupper())) %>%
  mutate(biotherapeutic_category = ifelse(!is.na(IMGT_mAb_DB_species), IMGT_mAb_DB_species, biotherapeutic_category)) %>%
  mutate(biotherapeutic_category = case_when(
    usan_substem %>% str_detect("-glutide") ~ "GLP analogs",
    TRUE ~ biotherapeutic_category
  )) %>%
  mutate(biotherapeutic_category = ifelse(!is.na(biotherapeutic_category), biotherapeutic_category, "Uncategorized"))



chembl_phase_34_biotherapeutics_cleaned_categorized %>%
  write_rds("0_reference_prots/chembl_phase_34_biotherapeutics_cleaned_categorized.rds")

chembl_phase_34_biotherapeutics_cleaned_categorized %>%
  write_tsv("0_reference_prots/chembl_phase_34_biotherapeutics_cleaned_categorized.tsv")




paste0("Data merging and processing over") %>% message()