#!/bin/sh

source sxconfig &&
./clean.sh &&
tar -xzf calcpercent-$VERSION.tar.gz &&
cd calcpercent-$VERSION &&
chown -R root.root . &&
make
