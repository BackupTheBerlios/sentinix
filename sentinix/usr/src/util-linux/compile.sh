#!/bin/sh

source sxconfig &&
./clean.sh &&
tar -xjvf util-linux-$VERSION.tar.bz2 &&
cd util-linux-$VERSION &&
chown -R root:root . &&
./configure &&
make HAVE_SLN=yes
