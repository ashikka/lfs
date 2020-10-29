tar -xf zstd-1.4.5
cd zstd-1.4.5

make

make prefix=/usr install

rm /usr/lib/libzstd.a
mv /usr/lib/libzstd.so.* /lib
ln -sf ../../lib/$(readlink /usr/lib/libzstd.so) /usr/lib/libzstd.so

rm -rf /sources/zstd-1.4.5