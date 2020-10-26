tar -xf coreutils-8.32.tar.xz
cd coreutils-8.32

./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess) \
            --enable-install-program=hostname \
            --enable-no-install-program=kill,uptime

make

make DESTDIR=$LFS install

mv $LFS/usr/bin/{cat,chgrp,chmod,chown,cp,date,dd,df,echo} $LFS/bin
mv $LFS/usr/bin/{false,ln,ls,mkdir,mknod,mv,pwd,rm}        $LFS/bin
mv $LFS/usr/bin/{rmdir,stty,sync,true,uname}               $LFS/bin
mv $LFS/usr/bin/{head,nice,sleep,touch}                    $LFS/bin
mv $LFS/usr/bin/chroot                                     $LFS/usr/sbin
mkdir -p $LFS/usr/share/man/man8
mv $LFS/usr/share/man/man1/chroot.1                        $LFS/usr/share/man/man8/chroot.8
sed -i 's/"1"/"8"/'                                        $LFS/usr/share/man/man8/chroot.8

rm -rf $LFS/sources/coreutils-8.32