#!/bin/sh
#
# rc.M
#
# init-script for multi-user runlevel.
#
# Original version found in Slackware 8.1, adapted (and modified) for
# SENTINIX by Michel Blomgren.
#
# $Id: rc.M,v 1.9 2004/01/17 22:34:11 replikan Exp $
#

echo -e "\033[1mEntering multi-user runlevel...\033[0m"

# Screen blanks after 10 minutes idle time.
/usr/bin/setterm -blank 10

# If there's no /etc/HOSTNAME, fall back on this default:
if [ ! -r /etc/HOSTNAME ]; then
  echo "sentinix.fubar" > /etc/HOSTNAME
fi

# Set the hostname.
/bin/hostname `cat /etc/HOSTNAME | cut -f1 -d.`

# Initialize the network subsystem.
if [ -x /etc/rc.d/rc.inet1 ]; then
  /etc/rc.d/rc.inet1
fi
if [ -x /etc/rc.d/rc.inet2 ]; then
  /etc/rc.d/rc.inet2
else
  # Start the system logger.  Normally this is started by
  # rc.inet2 because /usr might be mounted via NFS.
  if [ -x /etc/rc.d/rc.syslog ]; then
    . /etc/rc.d/rc.syslog start
  fi
fi

# Remove stale locks and junk files (must be done after mount -a!)
/bin/rm -f /var/lock/* /var/spool/uucp/LCK..* /tmp/.X*lock /tmp/core /core /tmp/canon.cal /var/sxrunning/* 1> /dev/null 2> /dev/null

# Ensure basic filesystem permissions sanity.
chmod 755 / 2> /dev/null
chmod 1777 /tmp /var/tmp

# Update all the shared library links:
/sbin/ldconfig

# Make /etc/cron.every5minutes/cacti chmod -x to ensure that Cacti is not running if rc.cacti is not +x.
chmod -x /etc/cron.every5minutes/cacti

# Load a custom keymap if the user has an rc.keymap script.
if [ -x /etc/rc.d/rc.keymap ]; then
    /etc/rc.d/rc.keymap
fi

# Start ntpd:
if [ -x /etc/rc.d/rc.ntpd ]; then
    /etc/rc.d/rc.ntpd start
fi

# Fire up openMosix cluster
if [ -x /etc/rc.d/rc.openmosix ]; then
    /etc/rc.d/rc.openmosix start
fi

# Start crond (Dillon's crond):
# If you want cron to actually log activity to /var/log/cron, then change
# -l10 to -l8 to increase the logging level.
if [ -x /usr/sbin/crond ]; then
    /usr/sbin/crond -l10 >>/var/log/cron 2>&1
fi

# Start the Postfix daemon:
if [ -x /etc/rc.d/rc.postfix ]; then
    /etc/rc.d/rc.postfix start
fi

# Start MySQL:
if [ -x /etc/rc.d/rc.mysqld ]; then
    /etc/rc.d/rc.mysqld start
fi

# Start Web server:
if [ -x /etc/rc.d/rc.httpd ]; then
    /etc/rc.d/rc.httpd startssl
fi

# Start pure-ftpd:
if [ -x /etc/rc.d/rc.ftpd ]; then
    /etc/rc.d/rc.ftpd start
fi

# Start snmpd:
if [ -x /etc/rc.d/rc.snmpd ]; then
    /etc/rc.d/rc.snmpd start
fi

# Start SnortCenter Sensor Agent:
if [ -x /etc/rc.d/rc.snortcenter ]; then
    /etc/rc.d/rc.snortcenter start
fi

# Start nagios
if [ -x /etc/rc.d/rc.nagios ]; then
    /etc/rc.d/rc.nagios start
fi

# Start nessus
if [ -x /etc/rc.d/rc.nessus ]; then
    # nessus wants the HOME variable:
    export HOME=/root
    /etc/rc.d/rc.nessus start
    unset HOME
fi

# Start Cacti
if [ -x /etc/rc.d/rc.cacti ]; then
    /etc/rc.d/rc.cacti start
fi

# Start BandwidthD
if [ -x /etc/rc.d/rc.bandwidthd ]; then
    /etc/rc.d/rc.bandwidthd start
fi

# Start the local setup procedure.
if [ -x /etc/rc.d/rc.local ]; then
    /etc/rc.d/rc.local
fi
