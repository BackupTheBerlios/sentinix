#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf links-$VERSION.tar.gz &&
cd links-$VERSION &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS -fstack-protector" ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --host=$SXARCH-$SXSYSNAME-linux &&
make &&
strip links
