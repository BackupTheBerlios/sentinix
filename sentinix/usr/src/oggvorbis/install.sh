#!/bin/sh
CWD=`pwd`

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf libao-${libaoVER}.tar.gz &&
cd libao-${libaoVER} &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS" ./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux \
    --disable-esdtest &&
make &&
installwatch -o $CWD/installwatch_1.log make install &&
ldconfig &&

cd $CWD &&
tar -xzf libogg-${liboggVER}.tar.gz &&
cd libogg-${liboggVER} &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS" ./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux &&
make &&
installwatch -o $CWD/installwatch_2.log make install &&
ldconfig &&

cd $CWD &&
tar -xzf libvorbis-${libvorbisVER}.tar.gz &&
cd libvorbis-${libvorbisVER} &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS" ./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux &&
make &&
installwatch -o $CWD/installwatch_3.log make install &&
ldconfig &&

cd $CWD &&
tar -xzf vorbis-tools-${VERSION}.tar.gz &&
cd vorbis-tools-${VERSION} &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS" ./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux &&
make &&
installwatch -o $CWD/installwatch_4.log make install
