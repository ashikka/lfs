tar -xf acl-2.2.53.tar.gz
cd acl-2.2.53

./configure --prefix=/usr         \
            --disable-static      \
            --libexecdir=/usr/lib \
            --docdir=/usr/share/doc/acl-2.2.53

make

make install

mv /usr/lib/libacl.so.* /lib
ln -sf ../../lib/$(readlink /usr/lib/libacl.so) /usr/lib/libacl.so

rm -rf /sources/acl-2.2.53