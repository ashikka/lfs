tar -xf findutils-4.7.0.tar.xz
cd findutils-4.7.0

./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)

make

make DESTDIR=$LFS install

mv $LFS/usr/bin/find $LFS/bin
sed -i 's|find:=${BINDIR}|find:=/bin|' $LFS/usr/bin/updatedb

rm -rf $LFS/sources/findutils-4.7.0