#!/bin/sh

source sxconfig &&
./clean.sh &&
tar -xzf replimenu-$VERSION.tar.gz &&
cd replimenu-$VERSION &&
chown -R root.root . &&
make
