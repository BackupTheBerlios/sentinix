#!/bin/sh

source sxconfig &&
cd screen-$VERSION &&
make install &&
cp -f etc/etcscreenrc /etc/screenrc
