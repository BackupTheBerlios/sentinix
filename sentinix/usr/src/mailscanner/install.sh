#!/bin/sh
CWD=`pwd`

source sxconfig &&
./clean.sh &&

cd /opt &&
( if [ ! -e MailScanner ]; then
    tar -xzf $CWD/MailScanner-$MSVERSION.tar.gz &&
    mv MailScanner-$MSVERSION MailScanner
    ( cd MailScanner/bin &&
      ln -sf tnef.linux tnef ) &&

    ( cd MailScanner/etc &&

	chmod -x MailScanner.conf &&
	#
	# sed patch:
	#
	cat MailScanner.conf | sed \
	    -e 's/^Run As User =$/Run As User = postfix/' \
	    -e 's/^Run As Group =$/Run As Group = postfix/' \
	    -e 's%^Incoming Queue Dir = /var/spool/mqueue.in$%Incoming Queue Dir = /var/spool/postfix/deferred%' \
	    -e 's%^Outgoing Queue Dir = /var/spool/mqueue$%Outgoing Queue Dir = /var/spool/postfix.mailscanner.out/incoming%' \
	    -e 's/^MTA = sendmail$/MTA = postfix/' \
	    -e 's%^Sendmail = /usr/lib/sendmail$%Sendmail = /usr/sbin/sendmail%' \
	    -e 's%^Sendmail2 = /usr/lib/sendmail$%Sendmail2 = /usr/sbin/sendmail%' \
	    -e 's/^Incoming Work Permissions = 0600$/Incoming Work Permissions = 0640/' \
	    -e 's/^Virus Scanners = none$/Virus Scanners = clamavmodule/' \
	    -e 's%^Monitors for ClamAV Updates = /usr/local%Monitors for ClamAV Updates = /usr%' \
	    -e 's/^Allow IFrame Tags = no$/Allow IFrame Tags = disarm/' \
	    -e 's/^Allow Object Codebase Tags = no$/Allow Object Codebase Tags = disarm/' \
	    -e 's/^Include Scanner Name In Reports = yes$/Include Scanner Name In Reports = no/' \
	    -e 's/^Spam List = ORDB-RBL/Spam List = # ORDB-RBL/' \
	    -e 's/^Use SpamAssassin = no$/Use SpamAssassin = yes/' \
	    -e 's/^High Scoring Spam Actions = deliver$/High Scoring Spam Actions = attachment/' \
	    -e 's%^SpamAssassin User State Dir =$%SpamAssassin User State Dir = /var/spool/MailScanner/spamassassin%' &&

    ## continue here

    
    ) &&


    cp $CWD/sentinix-MailScanner.conf /opt/MailScanner/etc/MailScanner.conf


    if [ ! $? -eq 0 ]; then
        exit $?
    fi
fi )

exit

( if [ ! -d /var/spool/postfix.mailscanner.out ]; then
    mkdir -p /var/spool/postfix.mailscanner.out
fi ) &&

( if [ ! -d /etc/postfix.mailscanner.out ]; then
    cp -a /etc/postfix /etc/postfix.mailscanner.out &&
    cp $CWD/postfix.mailscanner.out-main.cf /etc/postfix.mailscanner.out/main.cf &&
    cp $CWD/postfix.mailscanner.out-master.cf /etc/postfix.mailscanner.out/master.cf
fi ) &&

( if [ ! -d /var/spool/MailScanner ]; then
    mkdir -p /var/spool/MailScanner/incoming &&
    mkdir -p /var/spool/MailScanner/quarantine &&
    mkdir -p /var/spool/MailScanner/spamassassin &&
    chown postfix.postfix /var/spool/MailScanner/incoming &&
    chown postfix.postfix /var/spool/MailScanner/quarantine &&
    chown postfix.postfix /var/spool/MailScanner/spamassassin
fi )
