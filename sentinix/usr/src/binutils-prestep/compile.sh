#!/bin/sh
CWD=`pwd`

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzvf binutils-$VERSION.tar.gz &&
cd binutils-$VERSION &&
chown -R root.root . &&
mkdir $CWD/binutils-build &&
cd $CWD/binutils-build &&
$CWD/binutils-$VERSION/configure \
    --prefix=/static \
    --with-lib-path=/static/lib \
    --host=$SXARCH-$SXSYSNAME-linux \
    --target=$SXARCH-$SXSYSNAME-linux \
    --enable-shared &&
unset CFLAGS &&
unset LDFLAGS &&
make
