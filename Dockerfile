FROM php:7.2-cli-alpine3.7

LABEL authors="Julien Neuhart <j.neuhart@thecodingmachine.com>, David Négrier <d.negrier@thecodingmachine.com>"

# Installs missing libraries.
RUN apk add --no-cache --update \
    wget \
    tar

# Installs Docker client.
ENV DOCKER_VERSION "18.03.1-ce"
RUN wget -qO- https://download.docker.com/linux/static/stable/x86_64/docker-$DOCKER_VERSION.tgz | tar xvz -C . &&\
    mv ./docker/docker /usr/bin &&\
    rm -rf ./docker

# Installs Aenthill.
ENV AENTHILL_VERSION "0.0.14"
RUN curl -sf https://raw.githubusercontent.com/aenthill/aenthill/master/install.sh | BINDIR=/usr/local/bin sh -s $AENTHILL_VERSION