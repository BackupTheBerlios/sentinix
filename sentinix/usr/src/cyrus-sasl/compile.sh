#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf cyrus-sasl-$VERSION.tar.gz &&
cd cyrus-sasl-$VERSION &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS" \
LDFLAGS=-s ./configure \
	--prefix=/usr \
	--sysconfdir=/etc \
	--host=$SXARCH-$SXSYSNAME-linux \
	--with-gnu-ld \
	--enable-cram \
	--enable-digest \
	--enable-plain \
	--enable-login \
	--with-pwcheck \
	--disable-krb4 \
	--disable-gssapi \
	--disable-anon \
	--disable-ntlm &&
make
