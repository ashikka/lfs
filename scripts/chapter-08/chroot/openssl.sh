tar -xf openssl-1.1.1g.tar.gz
cd openssl-1.1.1g
./config --prefix=/usr         \
         --openssldir=/etc/ssl \
         --libdir=lib          \
         shared                \
         zlib-dynamic
make
sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile
make MANSUFFIX=ssl install
mv /usr/share/doc/openssl /usr/share/doc/openssl-1.1.1g
cp -fr doc/* /usr/share/doc/openssl-1.1.1g
rm -rf /sources/openssl-1.1.1g
