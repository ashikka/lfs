tar -xf bash-5.0.tar.gz
cd bash-5.0

patch -Np1 -i ../bash-5.0-upstream_fixes-1.patch

./configure --prefix=/usr                    \
            --docdir=/usr/share/doc/bash-5.0 \
            --without-bash-malloc            \
            --with-installed-readline

make

make install
mv -f /usr/bin/bash /bin

rm -rf /sources/bash-5.0