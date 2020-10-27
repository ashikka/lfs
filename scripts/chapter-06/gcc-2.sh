tar -xf gcc-10.2.0.tar.xz
cd gcc-10.2.0

tar -xf ../mpfr-4.1.0.tar.xz
mv mpfr-4.1.0 mpfr
tar -xf ../gmp-6.2.0.tar.xz
mv gmp-6.2.0 gmp
tar -xf ../mpc-1.1.0.tar.gz
mv mpc-1.1.0 mpc

mkdir build
cd build

mkdir -p $LFS_TGT/libgcc
ln -s ../../../libgcc/gthr-posix.h $LFS_TGT/libgcc/gthr-default.h

../configure                                       \
    --build=$(../config.guess)                     \
    --host=$LFS_TGT                                \
    --prefix=/usr                                  \
    CC_FOR_TARGET=$LFS_TGT-gcc                     \
    --with-build-sysroot=$LFS                      \
    --enable-initfini-array                        \
    --disable-nls                                  \
    --disable-multilib                             \
    --disable-decimal-float                        \
    --disable-libatomic                            \
    --disable-libgomp                              \
    --disable-libquadmath                          \
    --disable-libssp                               \
    --disable-libvtv                               \
    --disable-libstdcxx                            \
    --enable-languages=c,c++

make

make DESTDIR=$LFS install

ln -s gcc $LFS/usr/bin/cc

rm -rf $LFS/sources/gcc-10.2.0

