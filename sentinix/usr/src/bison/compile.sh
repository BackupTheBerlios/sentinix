#!/bin/sh
CWD=`pwd`

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzvf bison-$VERSION.tar.gz &&
cd bison-$VERSION &&
chown -R root.root . &&
patch -Np1 -i $CWD/bison-1.875-attribute.patch &&
CFLAGS=-O2 LDFALGS=-s ./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux &&
make
