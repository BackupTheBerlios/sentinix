#!/bin/sh

source sxconfig &&
cd announceuptime-$VERSION &&
make PREFIX=/usr/local install
