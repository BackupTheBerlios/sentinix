#!/bin/sh
CWD=`pwd`

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
echo "Decompressing glibc-$VERSION.tar.bz2, please wait..." &&
tar -xjf $CWD/glibc-$VERSION.tar.bz2 &&
cd glibc-$VERSION &&
tar -xjvf $CWD/glibc-linuxthreads-$VERSION.tar.bz2 &&
chown -R 0.0 . &&
patch -Np1 -i $CWD/glibc-$VERSION-sscanf-1.patch &&
cd $CWD &&
mkdir glibc-build &&
cd glibc-build &&
CFLAGS="-O2 -g $SXARCHFLAGS" $CWD/glibc-$VERSION/configure \
    --prefix=/usr \
    --target=$SXARCH-$SXSYSNAME-linux \
    --disable-profile \
    --enable-add-ons=linuxthreads \
    --without-cvs \
    --libexecdir=/usr/bin \
    --with-headers=/usr/include &&
make &&
make -C $CWD/glibc-$VERSION/linuxthreads/man
