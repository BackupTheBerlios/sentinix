#!/bin/sh
PATH=$PATH:/usr/bin:/bin
CWD=`pwd`

source sxconfig &&
cd man-$VERSION &&
make install
