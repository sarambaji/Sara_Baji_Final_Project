# AI in Healthcare Project

This repository contains the code and report for my **AI in Healthcare** analysis. The goal of the project is to explore whether the AI model’s diagnostic confidence is related to patient recovery time and satisfaction using a dataset of 5,000 patients.

---

## Repository Contents
```
ai_healthcare_project/
├── code/
│ ├── utils.R # helper functions (guessing column names, scaling values)
│ ├── 01_load_and_clean.R # loads and cleans the dataset
│ ├── 02_make_table1.R # creates the summary statistics table (Table 1)
│ ├── 03_make_fig1.R # creates the figure (AI confidence vs. recovery time)
├── data/
│ └── AI_in_HealthCare_Dataset.csv
├── tables/
│ └── table1_summary.csv # generated summary table
├── figs/
│ └── fig_ai_vs_recovery.png # generated figure
├── final_report.Rmd # main R Markdown report
├── final_report.html # knitted HTML report
├── Makefile # automates report generation
└── README.md # project documentation (this file)
```
---

## How to Generate the Final Report

From the project root, open a terminal and run:

```bash
make
```

This command uses the Makefile to:

1. Knit `final_report.Rmd` into `final_report.html`
2. Source all scripts in the `/code` directory
3. Generate:
   - `tables/table1_summary.csv` (the required Table 1)
   - `figs/fig_ai_vs_recovery.png` (the required Figure 1)


If you ever want to rebuild everything from scratch:
```bash
make -B
```

## The Final Report (`final_report.html`) Includes

**Introduction:** Overview of the dataset and research question.  

**Table 1:** Summary statistics (created by `code/02_make_table1.R`).  

**Figure 1:** Scatterplot of AI confidence vs. recovery time (created by `code/03_make_fig1.R`).  

**Notes:** Interpretation of the figure and limitations of the analysis.

## Dependencies

You’ll need R (≥ 4.0) and the following R packages:

- tidyverse  
- janitor  
- knitr  
- rmarkdown

## Reproducing the Environment

This project uses the `renv` package to ensure a reproducible R environment.

To install all required packages, run:

```bash
make install
```

This will:  
- Install renv (if not already installed)  
- Restore the package versions recorded in renv.lock