#!/bin/sh

. sxconfig &&
./clean.sh &&
tar -xzf libol-$VERSION.tar.gz &&
cd libol-$VERSION &&
chown -R root.root . &&
./configure --prefix=/usr