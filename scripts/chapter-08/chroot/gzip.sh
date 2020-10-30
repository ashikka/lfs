tar -xf gzip-1.10.tar.xz
cd gzip-1.10
./configure --prefix=/usr
make
make install
mv /usr/bin/gzip /bin
rm -rf /sources/gzip-1.10
