tar -xvf make-4.3.tar.gz
cd make-4.3
./configure --prefix=/usr
make
make install
cd /sources
rm -rf make-4.3