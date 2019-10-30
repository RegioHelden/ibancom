FROM ubuntu:xenial

ENV PYTHONUNBUFFERED 1
ENV LC_ALL=C.UTF-8
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update && apt-get -y install \
      build-essential \
      gcc \
      python3-venv \
      python3-dev \
      libffi-dev \
      libpq-dev  \
      libssl-dev \
      gettext \
      git \
    && \
    apt-get clean && \
    mkdir /app && \
    useradd -m app

WORKDIR /app

USER app

ADD requirements_dev.txt /app/

ENV PATH /home/app/venv/bin:${PATH}

RUN pyvenv ~/venv && \
    pip install --upgrade pip && \
    pip install wheel && \
    pip install -r requirements_dev.txt

ADD . /app/
