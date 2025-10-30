# helper functions for my project
# used to find the right columns and fix values

suppressPackageStartupMessages({
  library(tidyverse)
  library(janitor)
})

# try to guess column names for ai confidence and recovery time
guess_ai_col <- function(df_names) {
  possible <- c("ai_diagnosis_confidence", "ai_confidence", "ai_score")
  ai_col <- intersect(possible, df_names)
  if (length(ai_col) > 0) ai_col[1] else NA
}

guess_recovery_col <- function(df_names) {
  possible <- c("recovery_time", "recovery_days", "days_to_recovery")
  col <- intersect(possible, df_names)
  if (length(col) > 0) col[1] else NA
}

# if ai confidence is 0–1, change it to 0–100
make_ai_0_100 <- function(x) {
  if (all(x >= 0, na.rm = TRUE) && all(x <= 1, na.rm = TRUE)) {
    x * 100
  } else {
    x
  }
}
