#!/bin/sh
CWD=`pwd`

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf termcap-$VERSION.tar.gz &&
cd termcap-$VERSION &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS" ./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux &&
make
