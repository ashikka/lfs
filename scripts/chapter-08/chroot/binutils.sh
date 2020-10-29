tar -xf binutils-2.35.tar.xz
cd binutils-2.35

sed -i '/@\tincremental_copy/d' gold/testsuite/Makefile.in

mkdir build
cd       build

../configure --prefix=/usr       \
             --enable-gold       \
             --enable-ld=default \
             --enable-plugins    \
             --enable-shared     \
             --disable-werror    \
             --enable-64-bit-bfd \
             --with-system-zlib

make tooldir=/usr

make tooldir=/usr install

rm -rf /sources/binutils-2.35