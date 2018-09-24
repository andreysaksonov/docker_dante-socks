FROM ubuntu:xenial as BUILD

WORKDIR /build

RUN set -x && apt update && apt install checkinstall supervisord

RUN set -x && wget -O https://www.inet.no/dante/files/dante-1.4.2.tar.gz \
  && tar -xvf dante-1.4.2.tar.gz \
  && cd dante-1.4.2
  
RUN set -x && ./configure --prefix=/opt/dante-socks \
  && make && checkinstall
