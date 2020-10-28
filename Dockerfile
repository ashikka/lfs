# use ubuntu base image
FROM ubuntu:20.04

# install host system requirements ( see version-check.sh )
ENV DEBIAN_FRONTEND=noninteractive
RUN rm /bin/sh && \
    ln -s /bin/bash /bin/sh && \
    apt update && \
    apt install -y \
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
ENV BASH_ENV=/root/.bashrc
RUN printf "set +h \n \
            LFS=/lfs \n \
            HOME=/root \n \
            TERM=xterm \n \
            PS1='\u:\w\$ ' \n \
            umask 022 \n \
            LC_ALL=POSIX \n \
            LFS_TGT=$(uname -m)-lfs-linux-gnu \n \
            PATH=/usr/bin:$PATH \n \
            if [ ! -L /bin ]; then PATH=/bin:$PATH; fi \n \
            PATH=/lfs/tools/bin:$PATH \n \
            export LFS LC_ALL LFS_TGT PATH" > /root/.bashrc && \
    rm /etc/bash.bashrc

# copy build sripts
COPY scripts scripts

# build lfs on docker run
ENTRYPOINT ["bash", "-ex", "/scripts/entrypoint.sh"]
