#!/bin/sh

./clean.sh &&
tar -xzf ansirem.tar.gz &&
cd ansirem &&
chown -R root.root . &&
make PREFIX=/usr/local &&
make PREFIX=/usr/local install
