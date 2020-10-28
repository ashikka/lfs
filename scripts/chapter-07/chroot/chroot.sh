cd /sources
bash -ex /chroot/fs-layout.sh
bash -ex /chroot/files-symlinks.sh
bash -ex /chroot/libstdcpp-2.sh
bash -ex /chroot/gettext.sh
bash -ex /chroot/bison.sh
bash -ex /chroot/perl.sh
bash -ex /chroot/python.sh
bash -ex /chroot/texinfo.sh
bash -ex /chroot/util-linux.sh
bash -ex /chroot/cleanup.sh