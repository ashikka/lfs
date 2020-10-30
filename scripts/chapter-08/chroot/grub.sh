tar -xf grub-2.04.tar.xz
cd grub-2.04
./configure --prefix=/usr          \
            --sbindir=/sbin        \
            --sysconfdir=/etc      \
            --disable-efiemu       \
            --disable-werror
make
make install
mv /etc/bash_completion.d/grub /usr/share/bash-completion/completions
rm -rf /sources/grub-2.04
