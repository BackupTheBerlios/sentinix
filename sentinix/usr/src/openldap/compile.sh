#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf openldap-$VERSION.tgz &&
cd openldap-$VERSION &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS" \
LDFLAGS=-s ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --host=$SXARCH-$SXSYSNAME-linux \
    --enable-crypt \
    --enable-passwd \
    --enable-spasswd \
    --enable-ldap \
    --enable-ldbm &&
make depend &&
make
