#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf openssh-$VERSION.tar.gz &&
cd openssh-$VERSION &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS -Wall" ./configure \
    --prefix=/usr \
    --sysconfdir=/etc/ssh \
    --host=$SXARCH-$SXSYSNAME-linux \
    --with-default-path=/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin \
    --without-pam \
    --with-md5-passwords \
    --with-tcp-wrappers \
    --with-ipv4-default &&
make
