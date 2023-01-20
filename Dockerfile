FROM rocker/r-base:4.0.2

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git && \
    apt-get install -y texlive-latex-extra && \
    Rscript -e "install.packages(c('lubridate', 'ggplot2', 'data.table', 'rmarkdown'), repos='https://cran.rstudio.com')"
