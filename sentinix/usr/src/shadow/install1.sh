#!/bin/sh

source sxconfig &&
cd shadow-$VERSION &&
make install &&
cp etc/{limits,login.access} /etc &&
cp etc/login.defs.linux /etc/login.defs &&

cat /etc/login.defs | sed 's/^#MD5_CRYPT_ENAB\([\t ]*\)no/MD5_CRYPT_ENAB yes/' > /tmp/shadow.$$ &&
mv /tmp/shadow.$$ /etc/login.defs &&

ln -sf vipw /usr/sbin/vigr &&
rm /bin/vipw &&
mv /bin/sg /usr/bin/

## cruft: already is under /lib  --libdir=/lib  does this!
## move libs to /lib and create symlinks under /usr/lib/
#mv /usr/lib/lib{shadow,misc}.so.0* /lib &&
#ln -sf ../../lib/libshadow.so.0 /usr/lib/libshadow.so &&
#ln -sf ../../lib/libmisc.so.0 /usr/lib/libmisc.so &&

