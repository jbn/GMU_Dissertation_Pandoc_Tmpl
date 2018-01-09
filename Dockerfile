FROM generativist/pandoc_base:latest

LABEL maintainer="jbn@abreka.com"

ENV OUTPUT_FMT=pdf \
    FILTERS="--filter pandoc-citeproc" \
    META_FILE=meta.yaml \
    OUTPUT_DIR=build \
    OUTPUT_NAME=thesis \
    TEXINPUTS=${TEXINPUTS}:/src/template

WORKDIR /src

COPY build_thesis.sh /usr/local/bin
COPY bootstrap.sh /usr/local/bin
RUN mkdir /gmu
COPY Makefile.example /gmu
COPY meta.yaml.example /gmu
COPY template/ /gmu/template

CMD build_thesis.sh
