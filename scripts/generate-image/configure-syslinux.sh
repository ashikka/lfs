cd $LFS/sources

tar -xf syslinux-6.03.tar.xz
cd syslinux-6.03

cp bios/core/isolinux.bin /image/isolinux/isolinux.bin
cp bios/com32/elflink/ldlinux/ldlinux.c32 /image/isolinux/ldlinux.c32
cp ../../boot/vmlinuz-5.8.3-lfs-10.0-systemd /image/isolinux/vmlinuz

cat > /image/isolinux/isolinux.cfg << "EOF"
PROMT 0
DEFAULT bz2
LABEL bz2
    MENU LABEL Bz2 Image of RAM disk
    KERNEL vmlinuz
    APPEND initrd=lfs.bz2 root=/dev/ram0 rw 3
EOF

rm -rf $LFS/sources/syslinux-6.03