#!/bin/sh

CFLAGS="-O2 $SXARCHFLAGS"
LDFLAGS=-s
export CFLAGS LDFLAGS

source sxconfig &&
cd fping-$VERSION &&
make install
