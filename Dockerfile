FROM rocker/r-base:4.0.2

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git && \
    apt-get install -y texlive-latex-extra && \
    wget https://github.com/jgm/pandoc/releases/download/2.9.2.1/pandoc-2.9.2.1-1-amd64.deb && \
    dpkg -i pandoc-2.9.2.1-1-amd64.deb && \
    Rscript -e "install.packages(c('lubridate', 'ggplot2', 'data.table', 'rmarkdown'), repos='https://cran.rstudio.com')"
