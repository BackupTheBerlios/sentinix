divert(-1)
#
# $Id: sendmail.mc,v 1.5 2004/01/16 02:03:52 replikan Exp $
#
# This is the Sendmail macro configuration file for SENTINIX.
# If you want to change/extend your Sendmail configuration, edit this
# file, save and run:
#
#	m4 /etc/mail/sendmail.mc > /etc/mail/sendmail.cf
#
# Then restart Sendmail by running:
#
#	service sendmail restart
#
divert(0)
include(`/usr/share/sendmail-cf/m4/cf.m4')
VERSIONID(`SENTINIX GNU/Linux, $Id: sendmail.mc,v 1.5 2004/01/16 02:03:52 replikan Exp $')
OSTYPE(linux)
DOMAIN(generic)
define(`confDEF_USER_ID',``8:12'')

dnl # Uncomment the line below to send outgoing mail through an external
dnl # server:
dnl define(`SMART_HOST',`mailserver.example.tld')

dnl # Maximum number of daemons before starting to block, uncomment
dnl # the next two lines, and edit the values to actually use it
dnl define(`confMAX_DAEMON_CHILDREN',100)
dnl define(`confMAX_QUEUE_CHILDREN',100)

dnl # Run all deliveries in a separate process.
define(`confSEPARATE_PROC',`True')

dnl # This configuration option specifies whether the receiving server is the
dnl # best MX for a host and if so, try connecting to that host directly.
define(`confTRY_NULL_MX_LIST',`True')

dnl # This configuration option, if set to true, means Sendmail will _not_
dnl # insert the names and addresses of any local interfaces into the $=w
dnl # class, list of known equivalent addresses.
define(`confDONT_PROBE_INTERFACES',`True')

dnl # Path to procmail
define(`PROCMAIL_MAILER_PATH',`/usr/bin/procmail')

dnl # Path to (default) aliases file
define(`ALIAS_FILE', `/etc/mail/aliases')

dnl # Statistics file, for (binary) statistics
define(`STATUS_FILE', `/etc/mail/statistics')

dnl # Don't disclose any information to clients, etc.
define(`confPRIVACY_FLAGS', `authwarnings,needmailhelo,novrfy,noexpn,restrictqrun')

dnl # "A" tells Sendmail not to issue the AUTH= parameter for the
dnl # MAIL FROM command, unless authentication has succeeded.
define(`confAUTH_OPTIONS', `A')

dnl # Set some timings
define(`confTO_IDENT', `30s')
define(`confTO_HELO',`30s')
define(`confTO_MAIL',`30s')
define(`confTO_RCPT',`30s')
define(`confTO_DATAINIT',`30s')
define(`confTO_DATABLOCK',`30m')
define(`confTO_DATAFINAL',`30m')
define(`confTO_RSET',`30s')
define(`confTO_QUIT',`30s')
define(`confTO_MISC',`30s')
define(`confTO_COMMAND',`30s')
define(`confTO_CONTROL',`1m')
define(`confTO_QUEUEWARN', `4h')
define(`confTO_QUEUERETURN', `5d')

dnl # If there's no legal recipient fields, add the usual
dnl # "undisclosed-recipients:;" header
define(`confNO_RCPT_ACTION', `add-to-undisclosed')

dnl # Allow relaying for the following authentication mechanisms
TRUST_AUTH_MECH(`DIGEST-MD5 CRAM-MD5 LOGIN PLAIN')
dnl # Authentication mechanisms for AUTH
define(`confAUTH_MECHANISMS',`CRAM-MD5 DIGEST-MD5 LOGIN PLAIN')

dnl # TLS configuration, uncomment to enable, you'll need to create
dnl # these certificates first in order to actually use it
dnl define(`confCACERT_PATH', `/etc/mail/certs/')
dnl define(`confCACERT', `/etc/mail/certs/CA.cert.pem')
dnl define(`confSERVER_CERT', `/etc/mail/certs/smtp.cert.pem')
dnl define(`confSERVER_KEY', `/etc/mail/certs/smtp.key.pem')

dnl # Load average at which queue-only function kicks in. Default values
dnl # is (8 * numproc) where numproc is the number of processors online (if
dnl # that can be determined).
dnl define(`confQUEUE_LA', `12')
dnl define(`confREFUSE_LA', `18')

dnl #
dnl # FEATUREs
dnl #

dnl # Use the /etc/mail/local-host-names file to get alternate names
dnl # for this machine.
FEATURE(`use_cw_file')

dnl # /etc/mail/trusted-users file to get the names of users that will
dnl # be trusted, that is, able to set their envelope from address
dnl # using -f without generating a warning message.
FEATURE(`use_ct_file')

dnl # Don't route UUCP addresses
FEATURE(`nouucp',`nospecial')

dnl # Don't start the default MSA on port 587
FEATURE(`no_default_msa')

dnl # Location of sendmail restricted shell
FEATURE(`smrsh',`/usr/sbin/smrsh')

dnl # Use the mailertable routing feature
FEATURE(`mailertable',`hash -o /etc/mail/mailertable')

dnl # Use virtual users table
FEATURE(`virtusertable',`hash -o /etc/mail/virtusertable')

dnl # Use the access file feature
FEATURE(`access_db',`hash -T<TMPF> /etc/mail/access')

dnl # Reject all mail addressed to "address.REDIRECT" with a ``551 User
dnl # has moved; please try <address>'' message.
FEATURE(`redirect')

dnl # Include the local host domain even on locally delivered mail.
FEATURE(`always_add_domain')

dnl # Turns on the ability to block incoming mail for certain recipient
dnl # usernames, hostnames, or addresses.
FEATURE(`blacklist_recipients')

dnl # Accept mail for localhost.localdomain
LOCAL_DOMAIN(`localhost.localdomain')

dnl # Display the internal site name for root dispite any masquerade name
EXPOSED_USER(`root')

MAILER(local)
MAILER(smtp)
