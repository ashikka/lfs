tar -xf Python-3.8.5.tar.xz
cd Python-3.8.5

./configure --prefix=/usr   \
            --enable-shared \
            --without-ensurepip

make

make install

rm -rf /sources/Python-3.8.5