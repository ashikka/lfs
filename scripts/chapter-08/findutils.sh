tar -xvf findutils-4.7.0.tar.xz
cd findutils-4.7.0
./configure --prefix=/usr --localstatedir=/var/lib/locate
make
make install
mv -v /usr/bin/find /bin
sed -i 's|find:=${BINDIR}|find:=/bin|' /usr/bin/updatedb
cd /sources
rm -rf findutils-4.7.0
