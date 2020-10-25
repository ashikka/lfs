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
RUN mkdir -p $LFS

# downloading requirements
RUN mkdir $LFS/sources && \
    chmod a+wt $LFS/sources && \
    wget http://www.linuxfromscratch.org/lfs/view/stable-systemd/wget-list && \
    wget --input-file=wget-list --directory-prefix=$LFS/sources && \
    rm wget-list

# copy build sripts
COPY scripts scripts

ENTRYPOINT ["/scripts/entrypoint.sh"]
