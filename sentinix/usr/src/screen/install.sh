#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf screen-$VERSION.tar.gz &&
cd screen-$VERSION &&
chown -R root.root . &&
./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux \
    --with-sys-screenrc=/etc/screenrc \
    --disable-socket-dir &&
sed -e 's@.*#undef HAVE_BRAILLE.*@#define HAVE_BRAILLE 1@' \
    -e 's@.*#undef BUILTIN_TELNET.*@#define BUILTIN_TELNET 1@' config.h > tempconfig.$$ &&
mv -f tempconfig.$$ config.h &&
make &&
make install &&
if [ ! -e /etc/screenrc ]; then
    cp -f etc/etcscreenrc /etc/screenrc
fi
