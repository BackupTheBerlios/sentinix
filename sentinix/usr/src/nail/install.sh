#!/bin/sh

source sxconfig &&
cd nail-$VERSION &&
make install &&
ln -sf nail /usr/bin/mail &&
gzip /usr/man/man1/nail.1 &&
ln -sf nail.1.gz /usr/man/man1/mail.1.gz
