#!/bin/sh

source sxconfig &&
cd rexima-$VERSION &&
make PREFIX=/usr install
