#!/bin/sh

source sxconfig &&
./clean.sh &&
tar -xzf perl-$VERSION.tar.gz &&
cd perl-$VERSION &&
chown -R root.root . &&
CC=gcc ./configure.gnu \
    --prefix=/usr \
    -Dcccdlflags='-fPIC' \
    -Darchname=i486-linux &&
make &&
make test
