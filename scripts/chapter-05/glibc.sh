tar -xf glibc-2.32.tar.xz
cd glibc-2.32

case $(uname -m) in
    i?86)   ln -sf ld-linux.so.2 $LFS/lib/ld-lsb.so.3
    ;;
    x86_64) ln -sf ../lib/ld-linux-x86-64.so.2 $LFS/lib64
            ln -sf ../lib/ld-linux-x86-64.so.2 $LFS/lib64/ld-lsb-x86-64.so.3
    ;;
esac

patch -Np1 -i ../glibc-2.32-fhs-1.patch

mkdir build
cd build

../configure                             \
      --prefix=/usr                      \
      --host=$LFS_TGT                    \
      --build=$(../scripts/config.guess) \
      --enable-kernel=3.2                \
      --with-headers=$LFS/usr/include    \
      libc_cv_slibdir=/lib

make

make DESTDIR=$LFS install

$LFS/tools/libexec/gcc/$LFS_TGT/10.2.0/install-tools/mkheaders

rm -rf $LFS/sources/glibc-2.32