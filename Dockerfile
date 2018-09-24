ARG DANTE_VER=1.4.2

FROM ubuntu:xenial as BUILD

ARG DANTE_VER

RUN apt update -y
RUN apt install -y wget build-essential checkinstall

WORKDIR /build

RUN set -x && wget https://www.inet.no/dante/files/dante-${DANTE_VER}.tar.gz \
  && tar -xvf dante-${DANTE_VER}.tar.gz
  
RUN set -x && cd dante-${DANTE_VER} && pwd \
  && ./configure --prefix=/opt/dante-socks \
  && make \
  && checkinstall

FROM ubuntu:xenial

ARG DANTE_VER

RUN apt update -y
RUN apt install -y supervisor

COPY --from=BUILD /build/dante-${DANTE_VER}/dante_${DANTE_VER}-*.deb ./

RUN dpkg -i *.deb

COPY ./etc/ /etc/

CMD ["/usr/bin/supervisord"]
