tar -xf libffi-3.3.tar.gz
cd libffi-3.3

./configure --prefix=/usr --disable-static --with-gcc-arch=native

make

make install

rm -rf /sources/libffi-3.3