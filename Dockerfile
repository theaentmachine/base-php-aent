FROM php:7.2-cli-alpine3.7

LABEL authors="Julien Neuhart <j.neuhart@thecodingmachine.com>, David Négrier <d.negrier@thecodingmachine.com>"

# Defines SHELL.
ENV SHELL "/bin/sh"

# Installs missing libraries.
RUN apk add --no-cache --update \
    wget \
    tar

# Installs Docker client.
ENV DOCKER_VERSION "18.03.1-ce"
RUN wget -qO- https://download.docker.com/linux/static/stable/x86_64/docker-$DOCKER_VERSION.tgz | tar xvz -C . &&\
    mv ./docker/docker /usr/bin &&\
    rm -rf ./docker

# Installs Hermes.
ENV HERMES_VERSION "0.0.13"
RUN curl -sf https://raw.githubusercontent.com/aenthill/hermes/master/install.sh | BINDIR=/usr/bin sh -s $HERMES_VERSION

