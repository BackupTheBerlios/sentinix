#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf psmisc-$VERSION.tar.gz &&
cd psmisc-$VERSION &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS" ./configure --prefix=/usr \
    --exec-prefix=/ \
    --host=$SXARCH-$SXSYSNAME-linux &&
make
