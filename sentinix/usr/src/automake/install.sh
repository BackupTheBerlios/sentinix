#!/bin/sh
CWD=`pwd`

source sxconfig &&
cd automake-$VERSION1 &&
make install &&
cd $CWD &&

cd automake-$VERSION2 &&
make install &&
ln -sf automake-1.7 /usr/share/automake
