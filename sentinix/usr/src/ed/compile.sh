#!/bin/sh
CWD=`pwd`

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf ed-$VERSION.tar.gz &&
cd ed-$VERSION &&
# apply mkstemp() patch
patch -Np1 -i $CWD/ed-$VERSION.patch &&
CFLAGS=-O2 LDFLAGS=-s ./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux &&
make
