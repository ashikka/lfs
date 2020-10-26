tar -xf linux-5.8.3.tar.xz
cd linux-5.8.3

make mrproper

make headers
find usr/include -name '.*' -delete
rm usr/include/Makefile
cp -r usr/include $LFS/usr

rm -rf $LFS/sources/linux-5.8.3