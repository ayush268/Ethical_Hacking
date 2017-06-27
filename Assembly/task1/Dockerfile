FROM ubuntu:latest

USER root

RUN /bin/bash -c 'apt-get update && \
    apt-get install -y gdb'
COPY ./scripts /
