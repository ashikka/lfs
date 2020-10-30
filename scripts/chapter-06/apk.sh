mkdir apk
tar -xf apk.tar.xz -C apk

mv apk/lib/apk $LFS/lib/apk
mv apk/etc/apk $LFS/etc/apk
mv apk/usr/share/apk $LFS/usr/share/apk
mv apk/sbin/apk $LFS/sbin/apk

uname -m > $LFS/etc/apk/arch

rm -rf apk