#!/bin/sh
CWD=`pwd`

source sxconfig &&
./clean.sh &&
tar -xzf zlib-$VERSION.tar.gz &&
cd zlib-$VERSION &&
chown -R root.root . &&
patch -Np1 -i $CWD/zlib-1.1.4-vsnprintf.patch &&
./configure --prefix=/usr &&
make clean &&
make
