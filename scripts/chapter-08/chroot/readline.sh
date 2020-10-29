tar -xf readline-8.0.tar.gz
cd readline-8.0

sed -i '/MV.*old/d' Makefile.in
sed -i '/{OLDSUFF}/c:' support/shlib-install

./configure --prefix=/usr    \
            --disable-static \
            --with-curses    \
            --docdir=/usr/share/doc/readline-8.0

make SHLIB_LIBS="-lncursesw"

make SHLIB_LIBS="-lncursesw" install

mv /usr/lib/lib{readline,history}.so.* /lib
chmod u+w /lib/lib{readline,history}.so.*
ln -sf ../../lib/$(readlink /usr/lib/libreadline.so) /usr/lib/libreadline.so
ln -sf ../../lib/$(readlink /usr/lib/libhistory.so ) /usr/lib/libhistory.so

install -m644 doc/*.{ps,pdf,html,dvi} /usr/share/doc/readline-8.0

rm -rf /sources/readline-8.0