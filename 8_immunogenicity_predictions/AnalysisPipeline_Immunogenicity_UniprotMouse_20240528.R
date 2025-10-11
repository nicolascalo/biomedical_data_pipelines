# Script to extract sequences from a merged .fasta list from Uniprot to single .fasta files

## Library installation and loading

list.of.packages <-
  c(
"tidyverse",
"Biostrings"
  )

new.packages <-
  list.of.packages[!(list.of.packages %in% installed.packages()[, "Package"])]


if (length(new.packages)) {
  install.packages(new.packages, repos = "http://cran.us.r-project.org")

}

library(tidyverse)
library(Biostrings)


## Data processing



list.files("./1_rawdata_fasta_lists",
  full.names = TRUE
) %>%
  as.list() %>%
  lapply(function(file) {

    tibble(
      "prot_entry_entryname" = readAAStringSet(file) %>%
        names() %>%
        str_remove_all(" .*") %>%
        str_remove_all(".*\\|") %>%
        str_replace_all("\\|", "_"),
      prot_seq = readAAStringSet(file) %>%
        as.character() %>%
        unlist()
    ) %>%
      transpose() %>%
      lapply(function(prot) {
        paste0(">", prot$prot_entry_entryname) %>%
          write_lines(
            file = paste0(
              "./2_rawdata_fasta_indiv/",
              file %>% str_replace_all(".*/", "") %>% str_remove_all("\\.fasta"),
              "_",
              prot$prot_entry_entryname,
              ".fasta"
            )
          )

        prot$prot_seq %>%
          write_lines(
            file = paste0(
              "./2_rawdata_fasta_indiv/",
              file %>% str_replace_all(".*/", "") %>% str_remove_all("\\.fasta"),
              "_",
              prot$prot_entry_entryname,
              ".fasta"
            ),
            append = TRUE
          )
      })
  })
