#!/bin/sh

source sxconfig &&
cd texinfo-$VERSION &&
make install &&
make TEXMF=/usr/share/texmf install-tex
