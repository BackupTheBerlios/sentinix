#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar --use-compress-program bzip2 -xf procinfo-$VERSION.tar.bz2 &&
cd procinfo-$VERSION &&
chown -R root.root . &&
make CFLAGS="-O2 $SXARCHFLAGS" LDLIBS=-lncurses &&
strip procinfo
