#!/bin/sh

source sxconfig &&
cd installwatch-$VERSION &&
make PREFIX=/usr install
