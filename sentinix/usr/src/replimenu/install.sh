#!/bin/sh

source sxconfig &&
cd replimenu-$VERSION &&
make PREFIX=/usr install
