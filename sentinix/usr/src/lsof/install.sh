#!/bin/sh

source sxconfig &&
cd lsof_${VERSION}_src &&

# lsof has no "install" routine so we have to install manually
install -o root -g bin lsof /usr/sbin &&
install -m 644 lsof.8 /usr/man/man8
