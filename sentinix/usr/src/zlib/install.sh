#!/bin/sh
CWD=`pwd`

source sxconfig &&
cd zlib-$VERSION &&
make install &&
# compile and install shared libs too
./configure --prefix=/usr --shared &&
make clean &&
make &&
make install &&
cp zlib.3 /usr/man/man3/
