tar -xvf texinfo-6.7.tar.xz
cd texinfo-6.7.tar.xz
./configure --prefix=/usr --disable-static
make
make install
make TEXMF=/usr/share/texmf install-tex
cd /sources
rm -rf texinfo-6.7.tar.xz
