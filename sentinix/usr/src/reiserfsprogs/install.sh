#!/bin/sh
CWD=`pwd`

source ../sxarchconfig &&
source sxconfig &&
cd reiserfsprogs-$VERSION &&
make install
