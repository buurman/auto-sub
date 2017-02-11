FROM ubuntu:16.04
MAINTAINER Buurman <https://github.com/buurman>

ENV TZ Europe/Amsterdam
ENV LC_ALL en_US.UTF-8

RUN apt-get update
RUN apt-get -y install \
  nano \
  git \
  python-cheetah

RUN mkdir /opt/autosub
RUN git clone https://github.com/BenjV/autosub.git /opt/autosub

ADD default/config.properties /opt/autosub

EXPOSE 8084
VOLUME /tv

WORKDIR /opt/autosub
CMD python AutoSub.py
