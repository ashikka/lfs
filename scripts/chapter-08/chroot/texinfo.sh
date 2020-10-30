tar -xf texinfo-6.7.tar.xz
cd texinfo-6.7.tar.xz
./configure --prefix=/usr --disable-static
make
make install
make TEXMF=/usr/share/texmf install-tex
pushd /usr/share/info
  rm dir
  for f in *
  do
    install-info $f dir || :
  done
popd
rm -rf /sources/texinfo-6.7.tar.xz
