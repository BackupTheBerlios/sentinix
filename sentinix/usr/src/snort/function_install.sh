#!/bin/sh

[ "$1" = "" ] && exit 1
CWD="$1"

make install &&
( if [ ! -e /etc/snort ]; then
	mkdir /etc/snort
fi ) &&
( if [ ! -d /var/log/snort ]; then
	mkdir /var/log/snort
fi ) &&
( cd /etc; tar -xzf $CWD/snortrules.tgz ) &&
#
# acid
#
( if [ ! -d /usr/components/snort/acid ]; then
	mkdir -p /usr/components/snort/acid
fi ) &&
cd /usr/components/snort &&
tar -xzf $CWD/acid-0.9.6b23.tar.gz &&
#
# adodb
#
cd /usr/components/snort/acid &&
tar -xzf $CWD/adodb340.tgz &&
#
# jpgraph
#
cd /usr/components/snort/acid &&
tar -xzf $CWD/jpgraph-1.12.1.tar.gz &&
#mv jpgraph-1.12.1 jpgraph &&
ln -sf jpgraph-1.12.1 jpgraph
