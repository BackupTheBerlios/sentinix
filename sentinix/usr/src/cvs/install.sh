#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar --use-compress-program=bzip2 -xvf cvs-$VERSION.tar.bz2 &&
cd cvs-$VERSION &&
chown -R root.root . &&
CFLAGS="-O2" LDFLAGS="-s" ./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux &&
make &&
make install
