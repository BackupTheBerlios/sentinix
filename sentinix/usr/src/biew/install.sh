#!/bin/sh

source sxconfig &&
cd biew-$VERSION &&
cp biew /usr/bin/ &&
cp doc/biew.1 /usr/man/man1/
