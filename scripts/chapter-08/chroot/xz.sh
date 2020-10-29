tar -xf xz-5.2.5.tar.xz
cd xz-5.2.5

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/xz-5.2.5

make

make install
mv   /usr/bin/{lzma,unlzma,lzcat,xz,unxz,xzcat} /bin
mv /usr/lib/liblzma.so.* /lib
ln -sf ../../lib/$(readlink /usr/lib/liblzma.so) /usr/lib/liblzma.so

rm -rf /sources/xz-5.2.5