#!/bin/sh
CWD=`pwd`

source sxconfig &&
./clean.sh &&
tar -xzvf libpng-$VERSION.tar.gz &&
cd libpng-$VERSION &&
chown -R root.root . &&
cp scripts/makefile.linux Makefile &&
make prefix=/usr
