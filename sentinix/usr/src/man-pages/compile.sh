#!/bin/sh
CWD=`pwd`

source sxconfig &&
rm -rf man-pages-$VERSION &&
tar -xzf man-pages-$VERSION.tar.gz &&
cd man-pages-$VERSION &&
chown -R 0:0 .
