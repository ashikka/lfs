cp $IMAGE_BZ2 isolinux/

genisoimage -o $IMAGE_ISO                \
            -b isolinux/isolinux.bin     \
            -c isolinux/boot.cat         \
            -no-emul-boot                \
            -boot-load-size 4            \
            -boot-info-table $LFS/image/