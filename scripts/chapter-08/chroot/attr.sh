tar -xf attr-2.4.48.tar.gz
cd attr-2.4.48

./configure --prefix=/usr     \
            --disable-static  \
            --sysconfdir=/etc \
            --docdir=/usr/share/doc/attr-2.4.48

make

make install

mv /usr/lib/libattr.so.* /lib
ln -sf ../../lib/$(readlink /usr/lib/libattr.so) /usr/lib/libattr.so

rm -rf /sources/attr-2.4.48