#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzvf glib-$VERSION.tar.gz &&
cd glib-$VERSION &&
chown -R root.root . &&
./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --host=$SXARCH-$SXSYSNAME-linux &&
make CFLAGS="-O2 -Wall -D_REENTRANT"
