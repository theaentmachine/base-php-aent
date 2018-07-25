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
ENV AENTHILL_VERSION "0.0.17"
RUN curl -sf https://raw.githubusercontent.com/aenthill/aenthill/master/install.sh | BINDIR=/usr/local/bin sh -s $AENTHILL_VERSION

# Installs Python3, pip, ruamel.yaml and docker-compose.
RUN apk add --no-cache python3 &&\
    pip3 install --upgrade --no-cache-dir pip ruamel.yaml

# Installs Yaml-tools.
ENV YAML_TOOLS_VERSION "0.0.7"
RUN wget -q https://raw.githubusercontent.com/thecodingmachine/yaml-tools/$YAML_TOOLS_VERSION/src/yaml_tools.py -O /usr/bin/yaml-tools &&\
    chmod +x /usr/bin/yaml-tools