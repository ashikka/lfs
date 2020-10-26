mkdir $LFS/{bin,etc,lib,sbin,usr,var}
case $(uname -m) in
  x86_64) mkdir $LFS/lib64 ;;
esac

mkdir $LFS/tools