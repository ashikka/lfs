tar -xf xz-5.2.5.tar.xz
cd xz-5.2.5

./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess) \
            --disable-static                  \
            --docdir=/usr/share/doc/xz-5.2.5

make

make DESTDIR=$LFS install

mv $LFS/usr/bin/{lzma,unlzma,lzcat,xz,unxz,xzcat}  $LFS/bin
mv $LFS/usr/lib/liblzma.so.*                       $LFS/lib
ln -sf ../../lib/$(readlink $LFS/usr/lib/liblzma.so) $LFS/usr/lib/liblzma.so

rm -rf $LFS/sources/xz-5.2.5.tar.xz
