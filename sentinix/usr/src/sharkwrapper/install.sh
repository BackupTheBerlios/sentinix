#!/bin/sh

source sxconfig &&
cd sharkwrapper-$VERSION &&
make PREFIX=/usr install
