mkdir $LFS/{dev,proc,sys,run}

mknod -m 600 $LFS/dev/console c 5 1
mknod -m 666 $LFS/dev/null c 1 3

mount --bind /dev $LFS/dev

mount --bind /dev/pts $LFS/dev/pts
mount -t proc proc $LFS/proc
mount -t sysfs sysfs $LFS/sys
mount -t tmpfs tmpfs $LFS/run

if [ -h $LFS/dev/shm ]; then
  mkdir -p $LFS/$(readlink $LFS/dev/shm)
fi

mv /scripts/chapter-07/chroot $LFS/chroot

chroot "$LFS" /usr/bin/env -i   \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin \
    /bin/bash --login +h \
    -c "bash -ex /chroot/chroot.sh"

mv $LFS/chroot /scripts/chapter-07/chroot

umount $LFS/dev{/pts,}
umount $LFS/{sys,proc,run}

strip --strip-debug $LFS/usr/lib/*
strip --strip-unneeded $LFS/usr/{,s}bin/*
strip --strip-unneeded $LFS/tools/bin/*