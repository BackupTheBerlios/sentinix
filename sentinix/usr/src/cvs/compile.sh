#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
echo "uncompressing cvs-$VERSION"
tar --use-compress-program=bzip2 -xf cvs-$VERSION.tar.bz2 &&
cd cvs-$VERSION &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS -fstack-protector" LDFLAGS="-s" ./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux &&
make
