# [ -e $LOOP ] || mknod $LOOP b 7 0

# dd if=/dev/zero of=$IMAGE_RAM bs=1k count=$IMAGE_SIZE

# losetup -d $LOOP

# losetup $LOOP $IMAGE_RAM

# mkfs.ext4 -q -m 0 $LOOP $IMAGE_SIZE

# mkdir $LOOP_DIR

# mount $LOOP $LOOP_DIR
# rm -rf $LOOP_DIR/lost+found

# pushd $INITRD_TREE
# cp -dpR $(ls -A | grep -Ev "sources|tools|book|image|dist") $LOOP_DIR
# popd

# bzip2 -c $IMAGE_RAM > $IMAGE_BZ2

# umount $LOOP_DIR
# losetup -d $LOOP
# rm -rf $LOOP_DIR