#!/bin/sh
CWD=`pwd`

source sxconfig &&
cd rcs-$VERSION &&
make install
