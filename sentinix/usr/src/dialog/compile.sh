#!/bin/sh

source sxconfig &&
./clean.sh &&
tar -xzvf dialog-$VERSION.tar.gz &&
cd dialog-$VERSION &&
chown -R root.root . &&
make
