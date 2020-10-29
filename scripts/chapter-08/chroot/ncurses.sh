tar -xf ncurses-6.2.tar.gz
cd ncurses-6.2

sed -i '/LIBTOOL_INSTALL/d' c++/Makefile.in

./configure --prefix=/usr           \
            --mandir=/usr/share/man \
            --with-shared           \
            --without-debug         \
            --without-normal        \
            --enable-pc-files       \
            --enable-widec

make

make install

mv /usr/lib/libncursesw.so.6* /lib

ln -sf ../../lib/$(readlink /usr/lib/libncursesw.so) /usr/lib/libncursesw.so

for lib in ncurses form panel menu ; do
    rm -f                    /usr/lib/lib${lib}.so
    echo "INPUT(-l${lib}w)" > /usr/lib/lib${lib}.so
    ln -sf ${lib}w.pc        /usr/lib/pkgconfig/${lib}.pc
done

rm -f                     /usr/lib/libcursesw.so
echo "INPUT(-lncursesw)" > /usr/lib/libcursesw.so
ln -sf libncurses.so      /usr/lib/libcurses.so

mkdir       /usr/share/doc/ncurses-6.2
cp -R doc/* /usr/share/doc/ncurses-6.2

rm -rf /sources/ncurses