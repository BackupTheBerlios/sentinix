#!/bin/sh

source sxconfig &&
./clean.sh &&
tar --use-compress-program bzip2 -xf biew-$VERSION.tar.bz2 &&
cd biew-$VERSION &&
chown -R root.root . &&
make
