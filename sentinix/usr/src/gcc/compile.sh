#!/bin/sh
CWD=`pwd`

unset CFLAGS
unset LDFLAGS

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xvzf gcc-$VERSION.tar.gz &&
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
