#!/bin/sh
CWD=`pwd`

source sxconfig &&
cd binutils-build &&
make tooldir=/usr install &&
make tooldir=/usr install-info &&
cp $CWD/binutils-$VERSION/include/libiberty.h /usr/include/
