FROM alpine:3.20.1

ARG PYTHON3_VERSION="3.12.3"
ARG PYTHON2_VERSION="2.7.18"

LABEL image.os="alpine"
LABEL image.name="swish-analytics-base:alpine"
LABEL owner="Chris Herrera"
LABEL maintainer="christian@christian-herrera.com"
LABEL license="MIT"

# Install required apk packages
RUN apk upgrade --update-cache --available \
    && apk update \
    && apk add --no-cache \
    wget \
    build-base \
    libffi-dev \
    openssl-dev \
    bzip2-dev \
    zlib-dev \
    readline-dev \
    sqlite-dev \
    xz \
    git \
    python3 \
    py3-pip \
    R \
    R-dev \
    coreutils \
    ca-certificates

# Retrieve python2.7 source
RUN wget https://www.python.org/ftp/python/$PYTHON2_VERSION/Python-$PYTHON2_VERSION.tgz \
    && tar --extract -f Python-$PYTHON2_VERSION.tgz \
    && rm -rf Python-$PYTHON2_VERSION.tgz

# Build python2.7 from source
RUN cd Python-$PYTHON2_VERSION && \
    ./configure --enable-optimizations && \
    make && \
    make install && \
    cd .. && \
    rm -rf Python-$PYTHON2_VERSION

# Install pip for Python 2
RUN wget https://bootstrap.pypa.io/pip/2.7/get-pip.py && \
    python2 get-pip.py && \
    rm get-pip.py

# Remove unnecessary apk packages 
RUN apk del \
    build-base \
    libffi-dev \
    openssl-dev \
    bzip2-dev \
    zlib-dev \
    readline-dev \
    sqlite-dev \
    xz

# Install pip3 packages
# COPY requirements.txt /tmp/
# RUN pip3 install --trusted-host pypi.org --trusted-host files.pythonhosted.org -r /tmp/requirements.txt