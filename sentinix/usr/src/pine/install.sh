#!/bin/sh

source sxconfig &&
./clean.sh &&
tar -xzf pine${VERSION}.tar.gz &&
cd pine$VERSION &&
chown -R root.root . &&
./build slx SSLLIB=/usr/lib SSLDIR=/etc/ssl SSLCERTS=/etc/ssl/certs SSLINCLUDE=/usr/include/openssl SSLTYPE=unix &&
cd imap/imapd &&
install -s imapd /usr/sbin/imapd &&
cd ../ipopd &&
install -s ipop3d /usr/sbin/ipop3d &&
install -s ipop2d /usr/sbin/ipop2d &&
cd ../imapd &&
install -s imapd /usr/sbin/imapd &&
cd ../../bin &&
install -s pico /usr/bin/pico &&
install -s pilot /usr/bin/pilot &&
install -s pine /usr/bin/pine &&
/usr/bin/pine -conf > /usr/local/lib/pine.conf
