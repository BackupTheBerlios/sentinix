#!/bin/sh

source sxconfig &&
cd cyrus-sasl-$VERSION &&
make install &&
(
    if [ ! -d /var/pwcheck ]; then
	mkdir -p /var/pwcheck &&
	chown postfix.postfix /var/pwcheck &&
	chmod 0700 /var/pwcheck
    fi
)
