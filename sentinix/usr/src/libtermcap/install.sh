#!/bin/sh
CWD=`pwd`

source sxconfig &&
cd termcap-$VERSION &&
make install
