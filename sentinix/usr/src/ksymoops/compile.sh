#!/bin/sh

source sxconfig &&
./clean.sh &&
tar -xzf ksymoops-$VERSION.tar.gz &&
cd ksymoops-$VERSION &&
chown -R root.root . &&
make 'DEF_MAP=\"/boot/System.map\"'
