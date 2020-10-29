tar -xvf libpipeline-1.5.3.tar.gz
cd libpipeline-1.5.3
./configure --prefix=/usr
make
make install
cd /sources
rm -rf libpipeline-1.5.3