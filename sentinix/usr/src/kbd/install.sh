#!/bin/sh

source sxconfig &&
cd kbd-$VERSION &&
make install &&
( cp src/setlogcons /usr/bin/
  cp src/setvesablank /usr/bin/
  cp src/getunimap /usr/bin/

  # most Swedes are familiar with the se-latin1 name, sv-latin1.map.gz
  # is the same thing.
  ln -sf sv-latin1.map.gz /usr/share/kbd/keymaps/i386/qwerty/se-latin1.map.gz
)
