#!/bin/sh
CWD=`pwd`

source sxconfig &&
./clean.sh &&
rm -rf postfix-$VERSION &&
tar -xzf postfix-$VERSION.tar.gz &&
cd postfix-$VERSION &&
chown -R root.root . &&
make makefiles CCARGS="-DFD_SETSIZE=2048 -DUSE_SASL_AUTH -I/usr/include/sasl" AUXLIBS="-lsasl2" &&
make &&
strip bin/* libexec/* &&
sh postfix-install -non-interactive &&
echo "pwcheck_method: pwcheck" > /usr/lib/sasl2/smtpd.conf &&
ln -sf ../sbin/sendmail /usr/lib/sendmail
