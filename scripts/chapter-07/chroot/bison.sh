tar -xf bison-3.7.1.tar.xz
cd bison-3.7.1

./configure --prefix=/usr \
            --docdir=/usr/share/doc/bison-3.7.1

make

make install

rm -rf /sources/bison-3.7.1