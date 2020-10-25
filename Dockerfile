FROM ubuntu:20.04

# install host system requirements ( version-check.sh )
RUN DEBIAN_FRONTEND=non-interactive \
        rm /bin/sh && \
        ln -s /bin/bash /bin/sh && \
        apt update && \
        apt install -y \
            build-essential \
            bison \
            gawk \
            python3 \
            texinfo

# directory to build lfs
ENV LFS=/lfs
RUN mkdir /lfs

# downloading requirements
RUN mkdir $LFS/sources && \
    chmod a+wt $LFS/sources && \
    wget http://www.linuxfromscratch.org/lfs/view/stable-systemd/wget-list && \
    wget --input-file=wget-list --directory-prefix=$LFS/sources && \
    rm wget-list
