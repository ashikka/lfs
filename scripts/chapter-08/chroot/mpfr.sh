tar -xf mpfr-4.1.0
cd mpfr-4.1.0

./configure --prefix=/usr        \
            --disable-static     \
            --enable-thread-safe \
            --docdir=/usr/share/doc/mpfr-4.1.0

make
make html

make install
make install-html

rm -rf /sources/mpfr-4.1.0