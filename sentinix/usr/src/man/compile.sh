#!/bin/sh
PATH=$PATH:/usr/bin:/bin
CWD=`pwd`

source sxconfig &&
./clean.sh &&
tar -xjf man-$VERSION.tar.bz2 &&
cd man-$VERSION &&
chown -R root.root . &&

patch -Np1 -i $CWD/man-$VERSION-manpath.patch &&
patch -Np1 -i $CWD/man-$VERSION-pager.patch &&
patch -Np1 -i $CWD/man-$VERSION-80cols.patch &&

# apply a good patch from Slackware:
patch -Np1 -i $CWD/man-noisy.patch &&

./configure +lang all +traditional -confdir=/etc &&
# yet another good patch from Slackware:
patch -Np1 -i $CWD/man-msafer.patch &&
make
