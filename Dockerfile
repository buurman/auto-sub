FROM ubuntu:16.04
MAINTAINER Buurman <https://github.com/buurman>

ENV TZ Europe/Amsterdam
ENV LC_ALL en_US.UTF-8 nl_NL.UTF-8

RUN apt-get update
RUN apt-get -y install \
  nano \
  git \
  python-cheetah

RUN mkdir /opt/autosub-bootstrapbill
RUN git clone https://github.com/BenjV/autosub-bootstrapbill.git /opt/autosub-bootstrapbill

ADD default/config.properties /opt/autosub-bootstrapbill

EXPOSE 8084
VOLUME /tv

WORKDIR /opt/autosub-bootstrapbill
CMD python AutoSub.py
