#!/bin/sh

[ "$1" = "" ] && exit 1
CWD="$1"

    make install &&
    ( cd /usr/components/nagios/ &&
      tar -xzf $CWD/nagios_configfiles.tgz &&
      cd $CWD &&
      mkdir -p /usr/components/nagios/var/rw &&
      chown nagios.nobody /usr/components/nagios/var/rw &&
      chmod 6770 /usr/components/nagios/var/rw &&
      chown -R nagios.nobody /usr/components/nagios/etc &&
      chmod 0770 /usr/components/nagios/etc &&
      chmod 0660 /usr/components/nagios/etc/* &&
      chmod 0771 /usr/components/nagios/bin/nagios
    )

