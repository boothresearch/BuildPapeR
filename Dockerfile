FROM rocker/r-ver

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y wget
RUN wget https://github.com/jgm/pandoc/releases/download/2.9.2.1/pandoc-2.9.2.1-1-amd64.deb
RUN dpkg -i pandoc-2.9.2.1-1-amd64.deb
RUN apt-get install -y texlive-latex-extra
RUN Rscript -e "install.packages(c('lubridate', 'ggplot2', 'data.table', 'rmarkdown'), repos='https://cran.rstudio.com')"
RUN apt-get install -y git
