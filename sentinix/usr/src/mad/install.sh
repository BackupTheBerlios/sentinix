#!/bin/sh
CWD=`pwd`

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf libmad-${madVER}.tar.gz &&
cd libmad-${madVER} &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS" ./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux \
    --with-gnu-ld &&
make &&
make install &&

cd $CWD &&
tar -xzf libid3tag-${madVER}.tar.gz &&
cd libid3tag-${madVER} &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS" ./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux \
    --with-gnu-ld &&
make &&
make install &&

cd $CWD &&
tar -xzf madplay-${madVER}.tar.gz &&
cd madplay-${madVER} &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS" ./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux \
    --with-gnu-ld &&
make &&
make install
