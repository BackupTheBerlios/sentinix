#!/bin/sh

source sxconfig &&
cd iptables-$VERSION &&
make PREFIX=/usr install &&
make PREFIX=/usr install-devel
