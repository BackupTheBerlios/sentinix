#!/bin/sh

source sxconfig &&
cd bin86-$VERSION &&
make PREFIX=/usr install
