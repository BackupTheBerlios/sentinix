#!/bin/sh
CWD=`pwd`

unset CFLAGS
unset LDFLAGS

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
echo "Unpacking gcc-$VERSION, please wait..." &&
tar -xzf gcc-$VERSION.tar.gz &&
# install protector
( mkdir protector &&
  cd protector &&
  tar -xzf $CWD/protector-3.3-7.tar.gz &&
  cd $CWD/gcc-$VERSION/gcc &&
  patch -p1 -i $CWD/protector/protector.dif &&
  cp $CWD/protector/protector.{c,h} . ) &&
cd gcc-$VERSION &&
chown -R root.root . &&
patch -Np1 -i $CWD/gcc-$VERSION-no_fixincludes.patch &&
patch -Np1 -i $CWD/gcc-$VERSION-suppress-libiberty.patch &&
mkdir $CWD/gcc-build &&
cd $CWD/gcc-build &&

# don't compile f77, who uses Fortran anyway?
#    --enable-languages=c,c++,objc,java

$CWD/gcc-$VERSION/configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux \
    --target=$SXARCH-$SXSYSNAME-linux \
    --enable-threads=posix \
    --enable-__cxa_atexit \
    --enable-clocale=gnu \
    --enable-languages=c,c++ \
    --disable-checking \
    --with-gnu-ld \
    --verbose &&
make
