# use ubuntu base image
FROM ubuntu:20.04

# install host system requirements ( see version-check.sh )
RUN rm /bin/sh && \
    ln -s /bin/bash /bin/sh && \
    apt update && \
    DEBIAN_FRONTEND=noninteractive apt install -y \
        build-essential \
        bison \
        gawk \
        python3 \
        texinfo \
        wget

# downloading requirements
RUN mkdir -p /lfs/sources && \
    wget http://www.linuxfromscratch.org/lfs/view/10.0-systemd/wget-list && \
    wget --input-file=wget-list --directory-prefix=/lfs/sources && \
    rm wget-list

# create fs layout
RUN mkdir /lfs/{bin,etc,lib,sbin,usr,var} && \
    case $(uname -m) in x86_64) mkdir /lfs/lib64 ;; esac && \
    mkdir /lfs/tools

# set env variables
COPY bashrc root/.bashrc
COPY bash_profile root/.bash_profile
RUN rm /etc/bash.bashrc && \
    ln -s /root/.bashrc /etc/bash.bashrc

# copy build sripts
COPY scripts scripts

# build lfs on docker run
ENTRYPOINT ["bash", "-ex", "/scripts/entrypoint.sh"]
