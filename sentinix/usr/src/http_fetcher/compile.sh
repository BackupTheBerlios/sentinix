#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf http_fetcher-$VERSION.tar.gz &&
cd http_fetcher-$VERSION &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS" \
LDFLAGS=-s \
./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --host=$SXARCH-$SXSYSNAME-linux &&
make
