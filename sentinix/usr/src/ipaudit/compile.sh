#!/bin/sh
CWD=`pwd`

source sxconfig &&
./clean.sh &&
tar -xzvf ipaudit-$VERSION.tgz &&
cd ipaudit-$VERSION &&
chown -R root.root . &&
patch -Np1 -i $CWD/include_errno.h.diff &&
make
