#!/bin/sh
CWD=`pwd`

source sxconfig &&
cd ncurses-$VERSION &&
make install &&

# Move the include files from /usr/include into
# /usr/include/ncurses, then make symlinks back
# into /usr/include.

( cd /usr/include
  rm -rf ncurses
  mkdir ncurses
  for file in curses eti form menu ncurses panel term termcap unctrl ; do
    mv $file.h ncurses
  done
  for file in curses eti form menu ncurses panel term unctrl ; do
    ln -sf ncurses/$file.h .
  done
)

# Move the libraries into /lib, since they're important:
( cd /usr/lib ; mv libncurses.so.5* /lib )
( cd /usr/lib ; rm libncurses.so ; ln -sf /lib/libncurses.so.5 libncurses.so )
( cd /usr/lib ; rm libcurses.so ; ln -sf libncurses.so libcurses.so )
