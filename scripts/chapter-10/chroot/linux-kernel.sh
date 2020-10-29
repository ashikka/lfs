tar -xf linux-5.8.3.tar.xz
cd linux-5.8.3

make mrproper

make defconfig

make

make modules_install

cp arch/x86/boot/bzImage /boot/vmlinuz-5.8.3-lfs-10.0-systemd

cp System.map /boot/System.map-5.8.3

cp .config /boot/config-5.8.3

install -d /usr/share/doc/linux-5.8.3
cp -r Documentation/* /usr/share/doc/linux-5.8.3

install -m755 -d /etc/modprobe.d
cat > /etc/modprobe.d/usb.conf << "EOF"
# Begin /etc/modprobe.d/usb.conf

install ohci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i ohci_hcd ; true
install uhci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i uhci_hcd ; true

# End /etc/modprobe.d/usb.conf
EOF

rm -rf /sources/linux-5.8.3