#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf installwatch-$VERSION.tgz &&
cd installwatch-$VERSION &&
chown -R root.root . &&
make PREFIX=/usr
