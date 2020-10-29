tar  -xf libcap-2.42.tar.xz
cd libcap-2.42

sed -i '/install -m.*STACAPLIBNAME/d' libcap/Makefile

make lib=lib

make lib=lib PKGCONFIGDIR=/usr/lib/pkgconfig install
chmod 755 /lib/libcap.so.2.42
mv /lib/libpsx.a /usr/lib
rm /lib/libcap.so
ln -sf ../../lib/libcap.so.2 /usr/lib/libcap.so

rm -rf /sources/libcap-2.42