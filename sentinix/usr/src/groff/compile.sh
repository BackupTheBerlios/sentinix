#!/bin/sh
PKGDIR=/.

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzvf groff-$VERSION.tar.gz &&
cd groff-$VERSION &&
chown -R root.root . &&
# use Letter although I'm a Swede and we have A4
CFLAGS="-O2 $SXARCHFLAGS" \
CXXFLAGS="-O2 $SXARCHFLAGS" \
PAGE=letter \
./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux &&
make
