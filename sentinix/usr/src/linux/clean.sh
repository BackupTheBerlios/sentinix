#!/bin/sh

. sxconfig &&
rm -rf linux-$VERSION &&
if [ -h config.plain ]; then
    rm -f config.plain
fi
if [ -h config.om ]; then
    rm -f config.om
fi
if [ -h linux-$VERSION.tar.bz2 ]; then
    rm -f linux-$VERSION.tar.bz2
fi

rm -f installwatch.log