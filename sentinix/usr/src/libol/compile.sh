#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf libol-$VERSION.tar.gz &&
cd libol-$VERSION &&
chown -R root:root . &&
CPPFLAGS="-O2 $SXARCHFLAGS -fstack-protector" ./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux &&
make
