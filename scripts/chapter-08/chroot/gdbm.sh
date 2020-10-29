tar -xf gdbm-1.18.1.tar.gz
cd gdbm-1.18.1

sed -r -i '/^char.*parseopt_program_(doc|args)/d' src/parseopt.c

./configure --prefix=/usr    \
            --disable-static \
            --enable-libgdbm-compat

make

make install

rm -rf /sources/gdbm-1.18.1