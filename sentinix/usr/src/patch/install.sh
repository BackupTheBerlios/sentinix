#!/bin/sh

source sxconfig &&
cd patch-$VERSION &&
make CFLAGS=-O2 LDFLAGS=-s install
