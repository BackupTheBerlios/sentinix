#!/bin/sh
CWD=`pwd`

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzvf e2fsprogs-$VERSION.tar.gz &&
cd e2fsprogs-$VERSION &&
chown -R root:root . &&
rm -rf $CWD/e2fsprogs-build &&
mkdir $CWD/e2fsprogs-build &&
cd $CWD/e2fsprogs-build &&
CFLAGS=-O2 $CWD/e2fsprogs-$VERSION/configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux \
    --with-root-prefix="" \
    --enable-elf-shlibs &&
make
