#!/bin/sh

source sxconfig &&
./clean.sh &&
tar -xzf scapy-$VERSION.tar.gz &&
cd scapy-$VERSION &&
chown -R root:root .
