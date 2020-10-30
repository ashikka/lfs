tar -xf procps-ng-3.3.16.tar.xz
cd procps-ng-3.3.16
./configure --prefix=/usr                            \
            --exec-prefix=                           \
            --libdir=/usr/lib                        \
            --docdir=/usr/share/doc/procps-ng-3.3.16 \
            --disable-static                         \
            --disable-kill                           \
            --with-systemd
make
make install
mv /usr/lib/libprocps.so.* /lib
ln -sf ../../lib/$(readlink /usr/lib/libprocps.so) /usr/lib/libprocps.so
rm -rf /sources/procps-ng-3.3.16