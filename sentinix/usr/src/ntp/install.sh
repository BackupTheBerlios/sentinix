#!/bin/sh
CWD=`pwd`

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf ntp-$VERSION.tar.gz &&
cd ntp-$VERSION &&
chown -R root.root . &&
find . -perm 664 -exec chmod 644 {} \; &&
find . -perm 777 -exec chmod 755 {} \; &&
find . -perm 775 -exec chmod 755 {} \; &&
./configure \
    --prefix=/usr \
    --localstatedir=/var \
    --program-prefix="" \
    --program-suffix="" \
    --sysconfdir=/etc \
    --bindir=/usr/sbin \
    --host=$SXARCH-$SXSYSNAME-linux &&
make CFLAGS="-O2 $SXARCHFLAGS" LDFLAGS=-s &&
make CFLAGS="-O2 $SXARCHFLAGS" LDFLAGS=-s install
mkdir -p /etc/ntp &&
cat $CWD/ntp.conf > /etc/ntp.conf &&
cat $CWD/ntp.conf-sample > /etc/ntp.conf-sample &&
cat $CWD/ntp.keys > /etc/ntp/ntp.keys &&
cat $CWD/step-tickers > /etc/ntp/step-tickers
