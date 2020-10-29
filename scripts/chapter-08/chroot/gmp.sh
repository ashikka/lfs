tar -xf gmp-6.2.0.tar.xz
cd gmp-6.2.0

cp configfsf.guess config.guess
cp configfsf.sub   config.sub

./configure --prefix=/usr    \
            --enable-cxx     \
            --disable-static \
            --docdir=/usr/share/doc/gmp-6.2.0

make
make html

make install
make install-html

rm -rf /sources/gmp-6.2.0