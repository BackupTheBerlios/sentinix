#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf qstat$VERSION.tar.gz &&
cd qstat$VERSION &&
chown -R root.root . &&
make CFLAGS="-O2 $SXARCHFLAGS" LDFLAGS=-s SYSCONFDIR=/etc
