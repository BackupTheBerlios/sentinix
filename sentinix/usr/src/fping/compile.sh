#!/bin/sh

source ../sxarchconfig || exit 1

CFLAGS="-O2 $SXARCHFLAGS"
LDFLAGS=-s
export CFLAGS LDFLAGS

source sxconfig &&
./clean.sh &&
tar -xzf fping-$VERSION.tar.gz &&
cd fping-$VERSION &&
chown -R root.root . &&
./configure --prefix=/usr &&
make
