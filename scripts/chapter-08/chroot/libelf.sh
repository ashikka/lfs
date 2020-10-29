tar -xf elfutils-0.180.tar.bz2
cd elfutils-0.180

./configure --prefix=/usr --disable-debuginfod --libdir=/lib

make

make -C libelf install
install -m644 config/libelf.pc /usr/lib/pkgconfig
rm /lib/libelf.a

rm -rf /sources/elfutils-0.180