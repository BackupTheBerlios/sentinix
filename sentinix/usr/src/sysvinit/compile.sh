#!/bin/sh

source sxconfig &&
./clean.sh &&
tar -xzf sysvinit-$VERSION.tar.gz &&
cd sysvinit-$VERSION &&
chown -R root.root . &&
make -C src
