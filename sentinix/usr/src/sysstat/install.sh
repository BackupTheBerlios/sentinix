#!/bin/sh

source sxconfig &&
cd sysstat-$VERSION &&
make PREFIX=/usr install
