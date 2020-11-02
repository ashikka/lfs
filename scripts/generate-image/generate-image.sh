export LOOP=/dev/loop2
export IMAGE_RAM=/dist/lfs.ram
export IMAGE_SIZE=1000000
export LOOP_DIR=/image/loop
export IMAGE_BZ2=/dist/lfs.bz2
export IMAGE_ISO=/dist/lfs.iso

mkdir -p /image/isolinux
mkdir /dist

bash -ex /scripts/generate-image/configure-syslinux.sh

cd /image

bash -ex /scripts/generate-image/create-ramdisk.sh
bash -ex /scripts/generate-image/build-iso.sh

cp $IMAGE_ISO /lfs-10.0-systemd.iso

unset LOOP
unset IMAGE_RAM
unset IMAGE_SIZE
unset LOOP_DIR
unset IMAGE_BZ2
unset IMAGE_ISO

rm -rf /image
rm -rf /dist