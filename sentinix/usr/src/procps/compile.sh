#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf procps-$VERSION.tar.gz &&
cd procps-$VERSION &&
chown -R root.root . &&
make
