#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf rexima-$VERSION.tar.gz &&
cd rexima-$VERSION &&
chown -R root.root . &&
make PREFIX=/usr CFLAGS="-Wall -s -O2 $SXARCHFLAGS"
