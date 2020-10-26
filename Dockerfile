FROM ubuntu:20.04

# install host system requirements ( see version-check.sh )
ENV DEBIAN_FRONTEND=non-interactive
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

# directory to build lfs
ENV LFS=/lfs

# downloading requirements
RUN mkdir -p $LFS/sources && \
    wget http://www.linuxfromscratch.org/lfs/view/10.0-systemd/wget-list && \
    wget --input-file=wget-list --directory-prefix=$LFS/sources && \
    rm wget-list

# copy build sripts
COPY scripts scripts

# start building lfs on docker run
ENTRYPOINT ["bash", "-e", "/scripts/entrypoint.sh"]
