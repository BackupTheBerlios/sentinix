#!/bin/sh
. sxconfig &&
rm -rf nagios-$VERSION &&
rm -rf nagios-plugins-$PLUGINSVER &&
rm -f installwatch_??.log installwatch.log
