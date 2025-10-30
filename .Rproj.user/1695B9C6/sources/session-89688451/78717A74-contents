# Figure #1: AI confidence vs recovery time

suppressPackageStartupMessages({
  library(tidyverse)
  library(janitor)
})

ai_col <- guess_ai_col(names(dat))
recovery_col <- guess_recovery_col(names(dat))

if (!dir.exists("figs")) dir.create("figs", recursive = TRUE)

if (is.na(ai_col) || is.na(recovery_col)) {
  p <- ggplot() +
    annotate("text", x = 0.5, y = 0.5,
             label = "ai_diagnosis_confidence or recovery_time not found",
             size = 5) +
    theme_void()
  ggsave("figs/fig_ai_vs_recovery.png", p, width = 6, height = 4, dpi = 300)
} else {
  df <- dat %>%
    filter(!is.na(.data[[ai_col]]), !is.na(.data[[recovery_col]])) %>%
    mutate(
      ai_conf = as.numeric(.data[[ai_col]]),
      rec_time = as.numeric(.data[[recovery_col]])
    )
  
  p <- ggplot(df, aes(x = ai_conf, y = rec_time)) +
    geom_point(alpha = 0.6) +
    geom_smooth(method = "lm", se = TRUE) +
    labs(
      title = "AI diagnosis confidence vs recovery time",
      x = "AI diagnosis confidence",
      y = "Recovery time (days)"
    ) +
    theme_minimal()
  
  ggsave("figs/fig_ai_vs_recovery.png", p, width = 6, height = 4, dpi = 300)
}

