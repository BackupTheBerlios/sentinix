#!/bin/sh

source sxconfig &&
cd openssl-$VERSION &&
make install &&
cp -a certs/* /etc/ssl/certs/
