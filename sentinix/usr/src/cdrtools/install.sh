#!/bin/sh

source sxconfig &&
cd cdrtools-$VERSION &&
make INS_BASE=/usr DEFINSUSR=root install
