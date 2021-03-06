tar -xf coreutils-8.32.tar.xz
cd coreutils-8.32
patch -Np1 -i ../coreutils-8.32-i18n-1.patch
sed -i '/test.lock/s/^/#/' gnulib-tests/gnulib.mk
autoreconf -fi
FORCE_UNSAFE_CONFIGURE=1 ./configure \
            --prefix=/usr            \
            --enable-no-install-program=kill,uptime
make
make install
mv /usr/bin/{cat,chgrp,chmod,chown,cp,date,dd,df,echo} /bin
mv /usr/bin/{false,ln,ls,mkdir,mknod,mv,pwd,rm} /bin
mv /usr/bin/{rmdir,stty,sync,true,uname} /bin
mv /usr/bin/chroot /usr/sbin
mv /usr/share/man/man1/chroot.1 /usr/share/man/man8/chroot.8
sed -i 's/"1"/"8"/' /usr/share/man/man8/chroot.8
mv /usr/bin/{head,nice,sleep,touch} /bin
rm -rf /sources/coreutils-8.32
