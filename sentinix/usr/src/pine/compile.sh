#!/bin/sh

source sxconfig &&
./clean.sh &&
tar -xzf pine${VERSION}.tar.gz &&
cd pine$VERSION &&
chown -R root.root . &&
./build slx SSLLIB=/usr/lib SSLDIR=/etc/ssl SSLCERTS=/etc/ssl/certs SSLINCLUDE=/usr/include/openssl SSLTYPE=unix
