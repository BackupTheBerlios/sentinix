#!/bin/sh
CWD=`pwd`

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf libmad-$VERSION.tar.gz &&
cd libmad-$VERSION &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS" ./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux \
    --with-gnu-ld &&
make &&
installwatch -o $CWD/installwatch_1.log make install &&

cd $CWD &&
tar -xzf libid3tag-$VERSION.tar.gz &&
cd libid3tag-$VERSION &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS" ./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux \
    --with-gnu-ld &&
make &&
installwatch -o $CWD/installwatch_2.log make install &&

cd $CWD &&
tar -xzf madplay-$VERSION.tar.gz &&
cd madplay-$VERSION &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS" ./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux \
    --with-gnu-ld &&
make &&
installwatch -o $CWD/installwatch_3.log make install
