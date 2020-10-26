tar -xf tar-1.32.tar.xz
cd tar-1.32

./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess) \
            --bindir=/bin

make

make DESTDIR=$LFS install

rm -rf $LFS/sources/tar-1.32
