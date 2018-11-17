FROM ubuntu:18.04
MAINTAINER loblab

ARG APT_MIRROR=mirrors.aliyun.com

RUN sed -i "s/archive.ubuntu.com/$APT_MIRROR/" /etc/apt/sources.list
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install libcurl4-openssl-dev libsqlite3-dev
RUN apt-get -y install build-essential git wget

# see https://dlang.org/download.html
RUN wget http://master.dl.sourceforge.net/project/d-apt/files/d-apt.list -O /etc/apt/sources.list.d/d-apt.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EBCF975E5BA24D5E
RUN apt-get update && apt-get -y install --reinstall d-apt-keyring
RUN apt-get update && apt-get -y install dmd-compiler dub

RUN git clone https://github.com/skilion/onedrive.git
RUN cd onedrive \
  && make \
  && make install \
  && cd ..
RUN rm -rf onedrive

ARG USER=loblab
ARG UID=1000
ARG HOME=/home/$USER

RUN useradd -d $HOME -u $UID $USER
USER $USER
WORKDIR $HOME

COPY ./entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

