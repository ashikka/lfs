tar -xf autoconf-2.69
cd autoconf-2.69

sed -i '361 s/{/\\{/' bin/autoscan.in

./configure --prefix=/usr

make

make install

rm -rf /sources/autoconf-2.69