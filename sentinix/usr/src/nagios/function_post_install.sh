#!/bin/sh

[ "$1" = "" ] && exit 1
CWD="$1"

    cat > /usr/components/nagios/share/.htaccess <<EOF
AuthName "Nagios Login"
AuthType Basic
AuthUserFile /usr/components/nagios/etc/htpasswd.users
require valid-user
EOF

    cp /usr/components/nagios/share/.htaccess /usr/components/nagios/sbin/ &&
    htpasswd -mbc /usr/components/nagios/etc/htpasswd.users nagiosadmin nagios &&
    htpasswd -mb /usr/components/nagios/etc/htpasswd.users guest guest &&
    chown root.nobody /usr/components/nagios/etc/htpasswd.users &&
    chmod 0644 /usr/components/nagios/etc/htpasswd.users &&

    # install nagat
    cd /usr/components &&
    tar -xzf $CWD/nagat-sentinix.tgz

