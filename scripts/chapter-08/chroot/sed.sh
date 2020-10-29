tar -xf sed-4.8
cd sed-4.8

./configure --prefix=/usr --bindir=/bin

make
make html

make install
install -d -m755           /usr/share/doc/sed-4.8
install -m644 doc/sed.html /usr/share/doc/sed-4.8

rm -rf /sources/sed-4.8