tar -xf zlib-1.2.11.tar.xz
cd zlib-1.2.11

./configure --prefix=/usr

make

make install

mv /usr/lib/libz.so.* /lib
ln -sf ../../lib/$(readlink /usr/lib/libz.so) /usr/lib/libz.so

rm -rf /sources/zlib-1.2.11