#!/bin/sh
CWD=`pwd`

source sxconfig &&
cd ed-$VERSION &&
make install &&
mv /usr/bin/{ed,red} /bin
