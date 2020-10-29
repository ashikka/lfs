tar -xf expat-2.2.9.tar.xz
cd expat-2.2.9

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/expat-2.2.9

make

make install

install -m644 doc/*.{html,png,css} /usr/share/doc/expat-2.2.9

rm -rf /sources/expat-2.2.9