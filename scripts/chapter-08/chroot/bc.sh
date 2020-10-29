tar -xf bc-3.1.5.tar.xz
cd bc-3.1.5

PREFIX=/usr CC=gcc CFLAGS="-std=c99" ./configure.sh -G -O3

make

make install

rm -rf /sources/bc-3.1.5