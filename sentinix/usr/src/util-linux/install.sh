#!/bin/sh

source sxconfig &&
cd util-linux-$VERSION &&
make HAVE_SLN=yes install
