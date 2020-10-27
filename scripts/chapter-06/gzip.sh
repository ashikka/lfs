tar -xf gzip-1.10.tar.xz
cd gzip-1.10

./configure --prefix=/usr --host=$LFS_TGT

make

make DESTDIR=$LFS install

mv $LFS/usr/bin/gzip $LFS/bin

rm -rf $LFS/sources/gzip-1.10
