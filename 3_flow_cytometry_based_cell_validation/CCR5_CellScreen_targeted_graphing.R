library(tidyverse)


data_to_plot <-
  read_tsv("./output/CCR5_CellScreen_2_AggregatedIndivEventsFiltered.txt") %>%
  bind_rows(read_tsv("./output/CCR5_CellScreen_1_AggregatedIndivEventsFiltered.txt"))

{
  plot_obtained_APC_sep_all <-
    data_to_plot %>%
    mutate(cell_type = paste0(cell_background, "-", cell_mutation)) %>%
    dplyr::filter(!treatment_1 %>% str_detect("Live")) %>%
    mutate(sample = sample %>% as.character()) %>%
    dplyr::filter(!is.na(APC_probe)) %>%
    mutate(across(where(is.character), as.factor)) %>%
    ggplot() +
    geom_density(aes(
      x = `APC-A`,
      y = after_stat(scaled),
      group = paste0(APC_probe, sample),
      fill = APC_probe
    ), alpha = 0.4) +
    facet_grid(
      rows = vars(cell_type),
      cols = vars(treatment_1)
    ) +
    scale_x_log10(limits = c(1e2, NA)) +
    ggtitle(label = "Cancer cell line screening for CCR5 expression by flow cytometry")

  plot_obtained_APC_sep_all %>% ggsave(
    width = 9 * 1.2,
    height = 18 * 1.2,
    filename = "./output/CCR5_CellScreen_cleaned_fixed.png"
  )

}


{
  plot_obtained_APC_sep_all <-
    data_to_plot %>%
    mutate(cell_type = paste0(cell_background, "-", cell_mutation)) %>%
    dplyr::filter(treatment_1 %>% str_detect("Live")) %>%
    mutate(sample = sample %>% as.character()) %>%
    dplyr::filter(!is.na(APC_probe)) %>%
    mutate(across(where(is.character), as.factor)) %>%
    ggplot() +
    geom_density(aes(
      x = `APC-A`,
      y = after_stat(scaled),
      group = paste0(APC_probe, sample),
      fill = APC_probe
    ), alpha = 0.4) +
    facet_grid(
      rows = vars(cell_type),
      cols = vars(treatment_1)
    ) +
    scale_x_log10(limits = c(1e2, NA)) +
    ggtitle(label = "Cancer cell line screening for CCR5 expression by flow cytometry")


  plot_obtained_APC_sep_all

  plot_obtained_APC_sep_all %>% ggsave(
    width = 6 * 1.2,
    height = 12 * 1.2,
    filename = "./output/CCR5_CellScreen_cleaned_live.png"
  )
}


{
  plot_obtained_APC_sep_all <-
    data_to_plot %>%
    mutate(cell_type = paste0(cell_background, "-", cell_mutation)) %>%
    dplyr::filter(cell_type %>% str_detect("CHO|HEK")) %>%
    mutate(sample = sample %>% as.character()) %>%
    dplyr::filter(!is.na(APC_probe)) %>%
    mutate(across(where(is.character), as.factor)) %>%
    ggplot() +
    geom_density(aes(
      x = `APC-A`,
      y = after_stat(scaled),
      group = paste0(APC_probe, sample),
      fill = APC_probe
    ), alpha = 0.4) +
    facet_grid(
      rows = vars(cell_type),
      cols = vars(treatment_1)
    ) +
    scale_x_log10(limits = c(1e2, NA)) +
    ggtitle(label = "Cancer cell line screening for CCR5 expression by flow cytometry")

  plot_obtained_APC_sep_all %>% ggsave(
    width = 8 * 1.2,
    height = 12 * 1.2,
    filename = "./output/CCR5_CellScreen_cleaned_HEKCHO_v.png"
  )
}


{
  plot_obtained_APC_sep_all <-
    data_to_plot %>%
    mutate(cell_type = paste0(cell_background, "-", cell_mutation)) %>%
    dplyr::filter(cell_type %>% str_detect("CHO|HEK")) %>%
    mutate(sample = sample %>% as.character()) %>%
    dplyr::filter(!is.na(APC_probe)) %>%
    mutate(across(where(is.character), as.factor)) %>%
    ggplot() +
    geom_density(aes(
      x = `APC-A`,
      y = after_stat(scaled),
      group = paste0(APC_probe, sample),
      fill = APC_probe
    ), alpha = 0.4) +
    facet_grid(
      rows = vars(treatment_1),
      cols = vars(cell_type)
    ) +
    scale_x_log10(limits = c(1e2, NA)) +
    ggtitle(label = "Cancer cell line screening for CCR5 expression by flow cytometry")


  plot_obtained_APC_sep_all

  plot_obtained_APC_sep_all %>% ggsave(
    width = 12 * 1.2,
    height = 8 * 1.2,
    filename = "./output/CCR5_CellScreen_cleaned_HEKCHO_h.png"
  )
}