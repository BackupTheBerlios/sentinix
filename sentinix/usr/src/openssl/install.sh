#!/bin/sh

source sxconfig &&
cd openssl-$VERSION &&
make install &&
cp -dR certs/* /etc/ssl/certs/
