FROM rocker/r-base:4.0.2

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git && \
    apt-get install -y texlive-latex-extra
