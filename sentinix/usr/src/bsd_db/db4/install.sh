#!/bin/sh

#
# db 4.1 is fortunately pretty straigt forward to install :)
#

source sxconfig &&
cd db-$VERSION &&
cd build_unix &&
make install
