#!/bin/sh

source sxconfig &&
cd bchunk-$VERSION &&
make PREFIX=/usr install
