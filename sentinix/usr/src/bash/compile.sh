#!/bin/sh
CWD=`pwd`

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf bash-$VERSION.tar.gz &&
cd bash-$VERSION &&
chown -R root.root . &&
patch -Np1 -i $CWD/bash-2.05b-2.patch &&
cd $CWD &&
mkdir bashbuild &&
cd bashbuild &&
CFLAGS=-O2 $CWD/bash-$VERSION/configure \
    --prefix=/usr \
    --bindir=/bin \
    --host=$SXARCH-$SXSYSNAME-linux &&
make &&
strip bash
