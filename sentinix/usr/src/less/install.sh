#!/bin/sh
CWD=`pwd`

source sxconfig &&
cd less-$VERSION &&
make install &&
cp $CWD/lesspipe.sh /usr/bin/
