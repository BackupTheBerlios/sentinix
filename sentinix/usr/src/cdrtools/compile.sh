#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf cdrtools-$TARVER.tar.gz &&
cd cdrtools-$VERSION &&
chown -R root.root . &&
make INS_BASE=/usr DEFINSUSR=root
