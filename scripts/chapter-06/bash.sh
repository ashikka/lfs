tar -xf bash-5.0.tar.gz
cd bash-5.0

./configure --prefix=/usr                   \
            --build=$(support/config.guess) \
            --host=$LFS_TGT                 \
            --without-bash-malloc

make

make DESTDIR=$LFS install

mv $LFS/usr/bin/bash $LFS/bin/bash

ln -s bash $LFS/bin/sh

rm -rf $LFS/sources/bash-5.0