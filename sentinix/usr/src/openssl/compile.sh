#!/bin/sh

source sxconfig &&
./clean.sh &&
tar -xzf openssl-$VERSION.tar.gz &&
cd openssl-$VERSION &&
chown -R root.root . &&
./config --prefix=/usr --openssldir=/etc/ssl 386 no-mdc2 no-idea no-rc5 &&
make depend &&
make &&
make test
