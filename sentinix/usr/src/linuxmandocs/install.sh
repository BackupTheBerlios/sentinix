#!/bin/sh

source ../linux/sxconfig &&
cd ../linux/linux-$VERSION &&
cp -a Documentation/man /usr/share/man/man9
