#!/bin/sh
CWD=`pwd`

source sxconfig &&
cd gpm-$VERSION &&
make install
