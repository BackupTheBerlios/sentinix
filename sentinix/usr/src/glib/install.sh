#!/bin/sh

source sxconfig &&
cd glib-$VERSION &&
make CFLAGS="-O2 -Wall -D_REENTRANT" install
