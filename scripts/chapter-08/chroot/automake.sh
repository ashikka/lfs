tar -xf automake-1.16.2.tar.xz
cd automake-1.16.2

sed -i "s/''/etags/" t/tags-lisp-space.sh

./configure --prefix=/usr --docdir=/usr/share/doc/automake-1.16.2

make

make install

rm -rf /sources/automake-1.16.2