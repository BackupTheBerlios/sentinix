#!/bin/sh

source sxconfig &&
./clean.sh &&
tar -xzf sharkwrapper-$VERSION.tar.gz &&
cd sharkwrapper-$VERSION &&
chown -R root.root . &&
make &&
make PREFIX=/usr install
