#!/bin/sh

source sxconfig &&
cd sysvinit-$VERSION &&
make -C src install
