#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
cd http_fetcher-$VERSION &&
make install
