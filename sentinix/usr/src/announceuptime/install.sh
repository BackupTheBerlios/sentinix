#!/bin/sh

source sxconfig &&
./clean.sh &&
tar -xzf announceuptime-$VERSION.tar.gz &&
cd announceuptime-$VERSION &&
chown -R root.root . &&
make &&
make PREFIX=/usr/local install
