tar -xf dejagnu-1.6.2.tar.gz
cd dejagnu-1.6.2

./configure --prefix=/usr
makeinfo --html --no-split -o doc/dejagnu.html doc/dejagnu.texi
makeinfo --plaintext       -o doc/dejagnu.txt  doc/dejagnu.texi

make install
install -dm755  /usr/share/doc/dejagnu-1.6.2
install -m644   doc/dejagnu.{html,txt} /usr/share/doc/dejagnu-1.6.2

rm -rf /sources/dejagnu-1.6.2