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
export CFLAGS="-O2 $SXARCHFLAGS" &&
export LDFLAGS=-s &&
$CWD/binutils-$VERSION/configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux \
    --target=$SXARCH-$SXSYSNAME-linux \
    --enable-shared \
    --enable-64-bit-bfd &&
make clean &&
make tooldir=/usr &&
make tooldir=/usr info
