# this file loads and cleans the AI in Healthcare dataset

suppressPackageStartupMessages({
  library(tidyverse)
  library(janitor)
})

# read the dataset
dat <- readr::read_csv("data/AI_in_HealthCare_Dataset.csv", show_col_types = FALSE)

# clean column names
dat <- dat %>% clean_names()

# find main columns
ai_col <- guess_ai_col(names(dat))
recovery_col <- guess_recovery_col(names(dat))

# make sure ai confidence is 0–100
if (!is.na(ai_col)) {
  dat <- dat %>%
    mutate(!!ai_col := make_ai_0_100(.data[[ai_col]]))
}

# save a small preview of the cleaned data
if (!dir.exists("tables")) dir.create("tables", recursive = TRUE)
readr::write_csv(head(dat, 50), "tables/_data_preview.csv")
