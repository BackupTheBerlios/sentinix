#!/bin/sh

source sxconfig &&
./clean.sh &&
tar -xzf fblogo-$VERSION.tar.gz &&
cd fblogo-$VERSION &&
chown -R root.root . &&
make LIBS="-lm -lz -lpng" &&
make PREFIX=/usr install
