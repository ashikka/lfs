mount --bind /dev $LFS/dev

mount --bind /dev/pts $LFS/dev/pts
mount -t proc proc $LFS/proc
mount -t sysfs sysfs $LFS/sys
mount -t tmpfs tmpfs $LFS/run

mv /scripts/chapter-08/chroot $LFS/chroot

/usr/sbin/chroot "$LFS" /usr/bin/env -i   \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin \
    /bin/bash --login +h \
    -c "bash -ex /chroot/chroot.sh"

mv $LFS/chroot /scripts/chapter-08/chroot