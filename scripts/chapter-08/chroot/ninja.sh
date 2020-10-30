tar -xf ninja-1.10.0.tar.gz
cd ninja-1.10.0
export NINJAJOBS=4
sed -i '/int Guess/a \
  int   j = 0;\
  char* jobs = getenv( "NINJAJOBS" );\
  if ( jobs != NULL ) j = atoi( jobs );\
  if ( j > 0 ) return j;\
' src/ninja.cc
python3 configure.py --bootstrap
install -m755 ninja /usr/bin/
install -Dm644 misc/bash-completion /usr/share/bash-completion/completions/ninja
install -Dm644 misc/zsh-completion  /usr/share/zsh/site-functions/_ninja
unset NINJAJOBS
rm -rf /sources/ninja-1.10.0