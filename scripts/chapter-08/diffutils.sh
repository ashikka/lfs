tar -xvf diffutils-3.7.tar.xz
cd diffutils-3.7
./configure --prefix=/usr
make
make install
cd /sources
rm -rf diffutils-3.7
