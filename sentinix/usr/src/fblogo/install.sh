#!/bin/sh

source sxconfig &&
cd fblogo-$VERSION &&
make PREFIX=/usr install
