FROM python:3.8-slim-buster

ENV PYTHONUNBUFFERED 1
ENV LC_ALL=C.UTF-8
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update && apt-get -y install \
      git \
    && \
    apt-get clean && \
    mkdir /app && \
    useradd -m app

WORKDIR /app

ADD requirements_dev.txt /app/

RUN pip install --upgrade pip && \
    pip install wheel && \
    pip install -r requirements_dev.txt

USER app

ADD . /app/
