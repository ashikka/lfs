tar -xvf gzip-1.10.tar.xz
cd gzip-1.10
./configure --prefix=/usr
make
make install
mv -v /usr/bin/gzip /bin
cd /sources
rm -rf gzip-1.10
