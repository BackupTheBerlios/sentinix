#!/bin/sh
CWD=`pwd`

source sxconfig &&
cd mc-$VERSION &&
make install
