#!/bin/sh

source sxconfig &&
cd ../linux/linux-$VERSION &&
cp -a Documentation/man /usr/share/man/man9
