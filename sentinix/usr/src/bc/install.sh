#!/bin/sh
CWD=`pwd`

source sxconfig &&
cd bc-$VERSION &&
make install
