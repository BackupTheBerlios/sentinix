#!/bin/sh
if [ ! -e sxconfig ]; then
    ln -sf ../linux/sxconfig sxconfig
fi
source sxconfig &&
cd ../linux/linux-$VERSION &&
make mandocs
