#!/bin/sh

if [ ! -e sxconfig ]; then
        echo "sxconfig file could not be found!"
        exit 1
fi

. sxconfig

rm -rf Python-$VERSION
