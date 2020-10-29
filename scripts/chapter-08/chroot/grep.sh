tar -xf grep-3.4.tar.xz
cd grep-3.4

./configure --prefix=/usr --bindir=/bin

make

make install

rm -rf /sources/grep-3.4