tar -xf gettext-0.21.tar.xz
cd gettext-0.21

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/gettext-0.21

make

make install
chmod 0755 /usr/lib/preloadable_libintl.so

rm -rf /sources/gettext-0.21