tar -xf kmod-27.tar.xz
cd kmod-27

./configure --prefix=/usr          \
            --bindir=/bin          \
            --sysconfdir=/etc      \
            --with-rootlibdir=/lib \
            --with-xz              \
            --with-zlib

make

make install

for target in depmod insmod lsmod modinfo modprobe rmmod; do
  ln -sf ../bin/kmod /sbin/$target
done

ln -sf kmod /bin/lsmod

rm -rf /sources/kmod-27