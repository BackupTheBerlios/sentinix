#!/bin/sh

. sxconfig &&
rm -rf apache_$VERSION &&
rm -rf mod_ssl-$MODSSLVER &&
rm -rf php-$PHPVER &&
rm -f installwatch.log
