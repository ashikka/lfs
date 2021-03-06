echo "10.0-systemd" > $LFS/etc/lfs-release

cat > $LFS/etc/lsb-release << "EOF"
DISTRIB_ID="Linux From Scratch"
DISTRIB_RELEASE="10.0-systemd"
DISTRIB_CODENAME="lfs"
DISTRIB_DESCRIPTION="Linux From Scratch"
EOF

cat > $LFS/etc/os-release << "EOF"
NAME="Linux From Scratch"
VERSION="10.0-systemd"
ID=lfs
PRETTY_NAME="Linux From Scratch 10.0-systemd"
VERSION_CODENAME="lfs"
EOF