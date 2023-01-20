FROM rocker/r-base:4.0.2

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git

# Install tinytex
RUN mkdir /tinytex && \
    wget "https://yihui.org/gh/tinytex/tools/install-unx.sh" && \
    chmod +x install-unx.sh && \
    ./install-unx.sh

# Install Pandoc 2.9.2.1 & required R libraries
RUN wget https://github.com/jgm/pandoc/releases/download/2.9.2.1/pandoc-2.9.2.1-1-amd64.deb && \
    dpkg -i pandoc-2.9.2.1-1-amd64.deb && \
    Rscript -e "install.packages(c('lubridate', 'ggplot2', 'data.table', 'rmarkdown'), repos='https://cran.rstudio.com')"
