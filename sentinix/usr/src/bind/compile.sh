#!/bin/sh
CWD=`pwd`

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
mkdir -p /var/run/named &&
mkdir -p /var/named &&
tar -xzf bind-$VERSION.tar.gz &&
cd bind-$VERSION &&
#
# use /var/run/named instead of /var/run for pid files since we want to be able to 
# chown /var/run/named to e.g. daemon.bin in order to run bind under another user than 
# root.
#
zcat $CWD/bind.var.run.named.diff.gz | patch -Np1 &&
chown -R root.root . &&

# Threads break '-u' on Linux (for now)
CFLAGS="-O2 $SXARCHFLAGS" LDFLAGS=-s ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --host=$SXARCH-$SXSYSNAME-linux \
    --with-libtool \
    --enable-shared \
    --disable-threads \
    --with-openssl=/usr &&
make
