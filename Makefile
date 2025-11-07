# default target
all: final_report.html

# how to build the report
final_report.html: final_report.Rmd code/01_load_and_clean.R code/02_make_table1.R code/03_make_fig1.R code/utils.R data/AI_in_HealthCare_Dataset.csv
	Rscript -e "rmarkdown::render('final_report.Rmd', output_file = 'final_report.html')"

# clean up generated files
clean:
	rm -f final_report.html
	rm -f tables/table1_summary.csv
	rm -f figs/fig_ai_vs_recovery.png

# install rule
install:
	Rscript -e "if (!requireNamespace('renv', quietly = TRUE)) install.packages('renv')"
	Rscript -e "renv::restore()"
