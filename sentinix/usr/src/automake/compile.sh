#!/bin/sh
CWD=`pwd`

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf automake-$VERSION1.tar.gz &&
cd automake-$VERSION1 &&
chown -R root.root . &&
./configure --prefix=/usr &&
make &&
cd $CWD &&

tar -xzf automake-$VERSION2.tar.gz &&
cd automake-$VERSION2 &&
chown -R root.root . &&
./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux &&
make
