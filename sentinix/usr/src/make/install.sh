#!/bin/sh

source sxconfig &&
cd make-$VERSION &&
make install &&
chgrp root /usr/bin/make &&
chmod 755 /usr/bin/make
