mkdir -p $LFS/{bin,etc,lib,sbin,usr,var}
case $(uname -m) in
  x86_64) mkdir -p $LFS/lib64 ;;
esac

mkdir -p $LFS/tools