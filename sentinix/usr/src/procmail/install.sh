#!/bin/sh

source sxconfig &&
cd procmail-$VERSION &&
make install &&
make install-suid
