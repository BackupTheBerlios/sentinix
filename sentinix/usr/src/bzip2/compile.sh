#!/bin/sh

source sxconfig &&
./clean.sh &&
tar -xzf bzip2-$VERSION.tar.gz &&
cd bzip2-$VERSION &&
chown -R root.root . &&
make -f Makefile-libbz2_so &&
make
