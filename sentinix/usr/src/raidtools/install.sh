#!/bin/sh
CWD=`pwd`

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf raidtools-$VERSION.tar.gz &&
cd raidtools-$VERSION &&
chown -R root.root . &&
patch -Np1 -i $CWD/multiline_fix.diff &&
CFLAGS=-O2 ./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux &&
make &&
make install
