#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf wget-$VERSION.tar.gz &&
cd wget-$VERSION &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS" ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --host=$SXARCH-$SXSYSNAME-linux &&
make
