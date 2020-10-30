tar -xf Python-3.8.5.tar.xz
cd Python-3.8.5
./configure --prefix=/usr       \
            --enable-shared     \
            --with-system-expat \
            --with-system-ffi   \
            --with-ensurepip=yes
make
make install
chmod 755 /usr/lib/libpython3.8.so
chmod 755 /usr/lib/libpython3.so
ln -sf pip3.8 /usr/bin/pip3
install -dm755 /usr/share/doc/python-3.8.5/html 
tar --strip-components=1  \
    --no-same-owner       \
    --no-same-permissions \
    -C /usr/share/doc/python-3.8.5/html \
    -xf ../python-3.8.5-docs-html.tar.bz2
rm -rf /sources/Python-3.8.5
