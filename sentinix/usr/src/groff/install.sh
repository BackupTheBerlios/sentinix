#!/bin/sh

source sxconfig &&
cd groff-$VERSION &&
make install &&
ln -sf soelim /usr/bin/zsoelim &&
ln -sf eqn /usr/bin/geqn &&
ln -sf tbl /usr/bin/gtbl
