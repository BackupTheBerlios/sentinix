#!/bin/sh

source sxconfig &&
cd libpng-$VERSION &&
make prefix=/usr install
