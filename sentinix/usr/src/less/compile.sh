#!/bin/sh
CWD=`pwd`

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf less-$VERSION.tar.gz &&
cd less-$VERSION &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS" ./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux \
    --bindir=/bin \
    --sysconfdir=/etc &&
make &&
strip less lesskey lessecho
