#!/bin/sh

#
# mailx has been replaced by nail
# mailx is still available as the "mailx" command
#

source sxconfig &&
cd mailx-$VERSION.orig &&
cp mail /usr/bin/mailx &&
cat mail.1 | gzip -9c > /usr/man/man1/mailx.1.gz &&
cd misc &&
cp mail.rc /etc/ &&
cp mail.help /usr/lib/ &&
cp mail.tildehelp /usr/lib/
