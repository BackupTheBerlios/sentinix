#!/bin/sh
CWD=`pwd`

source ../sxarchconfig &&
source sxconfig &&
tar -xzf ntop-$VERSION.tgz &&
chown -R root:root ntop &&
cd $CWD/ntop/gdchart* &&

# patch CFALGS in gd's Makefile
sed -e "s@^CFLAGS=-O -fPIC@CFLAGS=-O2 -fPIC $SXARCHFLAGS -fstack-protector@" gd-*/Makefile > new.gd.makefile &&
mv new.gd.makefile gd-*/Makefile &&

# build gdchart
CC="gcc $SXARCHFLAGS -O2 -fstack-protector" ./configure &&
cd gd-*/libpng-*/ &&
# libpng
cp scripts/makefile.linux Makefile &&
make CFLAGS='-I$(ZLIBINC) -Wall -O2 -funroll-loops $(ALIGN) '"$SXARCHFLAGS -fstack-protector" &&
cd ../../zlib-*/ &&
# zlib
CFLAGS="$SXARCHFLAGS -O2 -fstack-protector" ./configure &&
make &&
cd ..
# gdchart and gd
make &&


cd $CWD/ntop/ntop &&
CFLAGS="$SXARCHFLAGS -O2 -fstack-protector" ./configure \
    --prefix=/usr/components/ntop \
    --with-rrd-root=/usr/components/rrdtool \
    --host=$SXARCH-$SXSYSNAME-linux &&
make
