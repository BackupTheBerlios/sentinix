#!/bin/sh

cd gcc-build &&
make install &&
ln -sf ../usr/bin/cpp /lib &&
ln -sf ../bin/cpp /usr/lib &&
ln -sf gcc /usr/bin/cc
