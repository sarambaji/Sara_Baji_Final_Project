FROM rocker/tidyverse

RUN apt-get update && apt-get install -y pandoc
RUN Rscript -e "install.packages(c('janitor', 'knitr', 'rmarkdown'), repos = 'https://cloud.r-project.org')"

# Create project directory and set it as working directory
RUN mkdir -p /project
WORKDIR /project

# Copy project files into the image
COPY code code
COPY data data
COPY tables tables
COPY figs figs
COPY final_report.Rmd .
COPY Makefile .

RUN mkdir -p /project/report

CMD ["bash", "-lc", "make && mv final_report.html report/"]
