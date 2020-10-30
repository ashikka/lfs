tar -xf gawk-5.1.0.tar.xz
cd gawk-5.1.0
sed -i 's/extras//' Makefile.in
./configure --prefix=/usr
make
make install
mkdir /usr/share/doc/gawk-5.1.0
cp    doc/{awkforai.txt,*.{eps,pdf,jpg}} /usr/share/doc/gawk-5.1.0
rm -rf /sources/gawk-5.1.0
