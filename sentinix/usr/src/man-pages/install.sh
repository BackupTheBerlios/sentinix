#!/bin/sh
CWD=`pwd`

source sxconfig &&
cd man-pages-$VERSION &&
make MANDIR=/usr/man install
