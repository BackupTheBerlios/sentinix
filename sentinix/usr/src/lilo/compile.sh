#!/bin/sh
CWD=`pwd`

source sxconfig &&
./clean.sh &&
tar -xzvf lilo-$VERSION.tar.gz &&
cd lilo-$VERSION &&
chown -R root.root . &&
make
