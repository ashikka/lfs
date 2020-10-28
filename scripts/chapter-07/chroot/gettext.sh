tar -xf gettext-0.21.tar.xz
cd gettext-0.22

./configure --disable-shared

make

cp gettext-tools/src/{msgfmt,msgmerge,xgettext} /usr/bin

rm -rf /sources/gettext-0.22