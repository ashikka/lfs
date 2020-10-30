mv /scripts/chapter-11/chroot $LFS/chroot

/usr/sbin/chroot "$LFS" /usr/bin/env -i   \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin \
    /bin/bash --login \
    -c "bash -ex /chroot/chroot.sh"

mv $LFS/chroot /scripts/chapter-11/chroot