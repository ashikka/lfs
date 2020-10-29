tar -xvf kbd-2.3.0.tar.xz
cd kbd-2.3.0
patch -Np1 -i ../kbd-2.3.0-backspace-1.patch
sed -i '/RESIZECONS_PROGS=/s/yes/no/' configure
sed -i 's/resizecons.8 //' docs/man/man8/Makefile.in
./configure --prefix=/usr --disable-vlock
make
make install
rm -v /usr/lib/libtswrap.{a,la,so*}
mkdir -v            /usr/share/doc/kbd-2.3.0
cp -R -v docs/doc/* /usr/share/doc/kbd-2.3.0
cd /sources
rm -rf kbd-2.3.0
