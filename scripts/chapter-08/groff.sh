tar -xvf groff-1.22.4.tar.gz
cd groff-1.22.4
PAGE=<paper_size> ./configure --prefix=/usr
make -j1
make install
cd /sources
rm -rf groff-1.22.4