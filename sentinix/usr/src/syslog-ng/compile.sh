#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf syslog-ng-$VERSION.tar.gz &&
cd syslog-ng-$VERSION &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS -fstack-protector" ./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux &&
make
