#!/bin/sh

source sxconfig &&
./clean.sh &&
tar -xzf sysstat-$VERSION.tar.gz &&
cd sysstat-$VERSION &&
chown -R root.root . &&
make PREFIX=/usr
