#!/bin/sh

source sxconfig &&
cd procps-$VERSION &&
make install &&
rm -f /lib/libproc.so
