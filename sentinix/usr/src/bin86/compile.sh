#!/bin/sh

source sxconfig &&
./clean.sh &&
tar -xzf bin86-$VERSION.tar.gz &&
cd bin86-$VERSION &&
chown -R root.root . &&
make
