#!/bin/sh

source sxconfig &&
cd lynx${UNTARVER} &&
make install &&
make install-help &&
make install-doc
