tar -xf dbus-1.12.20.tar.gz
cd dbus-1.12.20
./configure --prefix=/usr                       \
            --sysconfdir=/etc                   \
            --localstatedir=/var                \
            --disable-static                    \
            --disable-doxygen-docs              \
            --disable-xml-docs                  \
            --docdir=/usr/share/doc/dbus-1.12.20 \
            --with-console-auth-dir=/run/console
make
make install
mv /usr/lib/libdbus-1.so.* /lib
ln -sf ../../lib/$(readlink /usr/lib/libdbus-1.so) /usr/lib/libdbus-1.so
ln -sf /etc/machine-id /var/lib/dbus
sed -i 's:/var/run:/run:' /lib/systemd/system/dbus.socket
rm -rf /sources/dbus-1.12.20