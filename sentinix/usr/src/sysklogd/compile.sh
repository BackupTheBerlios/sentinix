#!/bin/sh

source sxconfig &&
./clean.sh &&
tar -xzf sysklogd-$VERSION.tar.gz &&
cd sysklogd-$VERSION &&
chown -R root.root . &&
make
