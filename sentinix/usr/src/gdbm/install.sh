#!/bin/sh

source sxconfig &&
cd gdbm-$VERSION &&
make install &&
make install-compat
