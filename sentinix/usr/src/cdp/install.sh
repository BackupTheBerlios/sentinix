#!/bin/sh
CWD=`pwd`

source sxconfig &&
./clean.sh &&
tar -xzf cdp-$VERSION.tar.gz &&
cd cdp-$VERSION &&
chown -R root.root . &&
make clean &&
zcat ../cdp-makefile.patch | patch -N &&
make &&
make install
