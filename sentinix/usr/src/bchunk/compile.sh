#!/bin/sh

source sxconfig &&
./clean.sh &&
tar -xzf bchunk-$VERSION.tar.gz &&
cd bchunk-$VERSION &&
chown -R root.root . &&
make &&
strip bchunk
