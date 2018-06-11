FROM ubuntu:bionic
MAINTAINER Thomas B. Mooney <tmooney@genome.wustl.edu>

LABEL \
    description="STRetch"

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && apt-get install -y \
    git \
    r-base-core \
    wget

RUN Rscript -e "install.packages(c('optparse','plyr','dplyr','tidyr','reshape2'), repos='http://cran.rstudio.com/')"

RUN git clone https://github.com/Oshlack/STRetch.git /opt/stretch \
    && cd /opt/stretch \
    && mkdir reference-data \
    && touch reference-data/DUMMY-dedup.sorted.bed \
    && ./install.sh \
    && rm -rf reference-data
