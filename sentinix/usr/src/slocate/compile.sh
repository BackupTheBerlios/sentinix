#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf slocate-$VERSION.tar.gz &&
cd slocate-$VERSION &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS" ./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux &&
make &&
strip slocate &&
rm -f /usr/man/man1/{locate.1,locate.1.gz,updatedb.1,updatedb.1.gz}
