#!/bin/sh

source sxconfig &&
cd pine$VERSION &&
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
