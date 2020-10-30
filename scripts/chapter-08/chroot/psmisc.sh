tar -xf psmisc-23.3.tar.xz
cd psmisc-23.3

./configure --prefix=/usr

make

make install

mv /usr/bin/fuser   /bin
mv /usr/bin/killall /bin

rm -rf /sources/psmisc-23.3