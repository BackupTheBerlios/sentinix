#!/bin/sh
CWD=`pwd`
TARGETDIR=/usr/components/mailscanner

source sxconfig &&
cd MailScanner-$VERSION &&

mkdir -p $TARGETDIR &&
cp -dR . $TARGETDIR/ &&
cd /usr/components/mailscanner &&

( cd bin && ln -sf tnef.linux tnef ) &&
( cd etc &&
    #
    # sed patch for sentinix (sendmail):
    #

    cat MailScanner.conf | sed \
	-e 's@%org-name% = yoursite@%org-name% = sentinix@' \
	-e 's@/usr/lib/sendmail@/usr/sbin/sendmail@g' \
	-e 's@^Virus Scanners = none@Virus Scanners = clamavmodule@' \
	-e 's@^Monitors for ClamAV Updates = /usr/local/share/clamav/@Monitors for ClamAV Updates = /usr/share/clamav/@' \
	-e 's@^Allow IFrame Tags = no@Allow IFrame Tags = disarm@' \
	-e 's@^Allow Object Codebase Tags = no@Allow Object Codebase Tags = disarm@' \
	-e 's@^Spam List = ORDB-RBL #@Spam List = ORDB-RBL spamhaus.org spamcop.net #@' \
	-e 's@^Spam Lists To Reach High Score = 5@Spam Lists To Reach High Score = 2@' \
	-e 's@^Use SpamAssassin = no@Use SpamAssassin = yes@' \
	-e 's@^Required SpamAssassin Score = 6@Required SpamAssassin Score = 8@' \
	-e 's@^Always Include SpamAssassin Report = no@Always Include SpamAssassin Report = yes@' \
	-e 's@^High Scoring Spam Actions = deliver@High Scoring Spam Actions = attachment@' \
	-e 's@^Log Speed = no@Log Speed = yes@' > /tmp/mailscanner.conf &&
    mv /tmp/mailscanner.conf MailScanner.conf &&

    cat spam.assassin.prefs.conf | sed \
	-e 's@^whitelist_from@# whitelist_from@' \
	-e 's@^# skip_rbl_checks 1@skip_rbl_checks 1@' > /tmp/spam.assassin.prefs.conf &&
    mv /tmp/spam.assassin.prefs.conf spam.assassin.prefs.conf

#    #
#    # sed patch for postfix:
#    #
#    cat MailScanner.conf | sed \
#        -e 's/^Run As User =$/Run As User = postfix/' \
#        -e 's/^Run As Group =$/Run As Group = postfix/' \
#        -e 's%^Incoming Queue Dir = /var/spool/mqueue.in$%Incoming Queue Dir = /var/spool/postfix%' \
#        -e 's%^Outgoing Queue Dir = /var/spool/mqueue$%Outgoing Queue Dir = /var/spool/postfix.mailscanner.out/incoming%' \
#        -e 's/^MTA = sendmail$/MTA = postfix/' \
#        -e 's%^Sendmail = /usr/lib/sendmail$%Sendmail = /usr/sbin/sendmail%' \
#        -e 's%^Sendmail2 = /usr/lib/sendmail$%Sendmail2 = /usr/sbin/sendmail%' \
#        -e 's/^Incoming Work Permissions = 0600$/Incoming Work Permissions = 0640/' \
#        -e 's/^Virus Scanners = none$/Virus Scanners = clamavmodule/' \
#        -e 's%^Monitors for ClamAV Updates = /usr/local%Monitors for ClamAV Updates = /usr%' \
#	 -e 's/^Allow IFrame Tags = no$/Allow IFrame Tags = disarm/' \
#        -e 's/^Allow Object Codebase Tags = no$/Allow Object Codebase Tags = disarm/' \
#        -e 's/^Include Scanner Name In Reports = yes$/Include Scanner Name In Reports = no/' \
#        -e 's/^Spam List = ORDB-RBL/Spam List = # ORDB-RBL/' \
#        -e 's/^Use SpamAssassin = no$/Use SpamAssassin = yes/' \
#        -e 's/^High Scoring Spam Actions = deliver$/High Scoring Spam Actions = attachment/' \
#        -e 's%^SpamAssassin User State Dir =$%SpamAssassin User State Dir = /var/spool/MailScanner/spamassassin%' &&

) &&

( if [ ! -d /var/spool/MailScanner ]; then
    mkdir -p /var/spool/MailScanner/incoming &&
    mkdir -p /var/spool/MailScanner/quarantine &&
    mkdir -p /var/spool/MailScanner/spamassassin &&
    mkdir -p /var/spool/MailScanner/archive &&
    chown postfix.postfix /var/spool/MailScanner/incoming &&
    chown postfix.postfix /var/spool/MailScanner/quarantine &&
    chown postfix.postfix /var/spool/MailScanner/spamassassin
fi )

