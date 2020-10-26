tar -xf sed-4.8.tar.xz
cd sed-4.8

./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --bindir=/bin

make

make DESTDIR=$LFS install

rm -rf $LFS/sources/sed-4.8
