#!/bin/sh

source sxconfig &&
./clean.sh &&
tar -xzf hdparm-$VERSION.tar.gz &&
cd hdparm-$VERSION &&
make
