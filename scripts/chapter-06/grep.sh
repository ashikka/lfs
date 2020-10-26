tar -xf grep-3.4.tar.xz
cd grep-3.4

./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --bindir=/bin

make

make DESTDIR=$LFS install

rm -rf $LFS/sources/grep-3.4