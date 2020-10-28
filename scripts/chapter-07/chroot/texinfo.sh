tar -xf texinfo-6.7.tar.xz
cd texinfo-6.7

./configure --prefix=/usr

make

make install

rm -rf /sources/texinfo-6.7