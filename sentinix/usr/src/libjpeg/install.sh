#!/bin/sh

source sxconfig &&
cd jpeg-$VERSION &&
make install &&
make install-lib
