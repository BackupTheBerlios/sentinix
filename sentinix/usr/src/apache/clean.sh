#!/bin/sh

. sxconfig &&
rm -rf apache_$APACHEVER &&
rm -rf mod_ssl-$MODSSLVER &&
rm -rf php-$PHPVER &&
rm -f installwatch.log
