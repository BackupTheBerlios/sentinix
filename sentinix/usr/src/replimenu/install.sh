#!/bin/sh

source sxconfig &&
./clean.sh &&
tar -xzvf replimenu-$VERSION.tar.gz &&
cd replimenu-$VERSION &&
chown -R root.root . &&
make &&
make PREFIX=/usr install
