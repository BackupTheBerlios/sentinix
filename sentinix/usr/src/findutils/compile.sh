#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf findutils-$VERSION.tar.gz &&
cd findutils-$VERSION &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS" LDFLAGS=-s ./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux \
    --sysconfdir=/etc \
    --localstatedir=/var/lib/misc &&
# patch out locate, we'll be using slocate (also GNU GPL)
sed 's/^SUBDIRS = gnulib lib intl find xargs locate/SUBDIRS = gnulib lib intl find xargs/' Makefile > makefile.$$ &&
mv makefile.$$ Makefile &&
make
