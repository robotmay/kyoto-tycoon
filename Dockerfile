FROM debian:jessie
MAINTAINER Robert May <rob@afternoonrobot.co.uk>

RUN apt-get update && \
    apt-get install -y wget make gcc build-essential liblzo2-2 liblzma5 liblua5.1-0 liblua5.1.0-dev zlib1g-dev

RUN cd /tmp && \
    wget https://github.com/sapo/kyoto/archive/snapshot-20150317.tar.gz && \
    tar xzvf snapshot-20150317.tar.gz && \
    cd kyoto-snapshot-20150317 && \
    make deb && \
    cd build && \
    dpkg --force-depends -i kyoto-tycoon-*.deb 

EXPOSE 1978

ENTRYPOINT ["ktserver"]
