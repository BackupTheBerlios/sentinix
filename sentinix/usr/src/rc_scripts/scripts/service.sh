#
# $Id: service.sh,v 1.4 2004/02/01 23:32:49 replikan Exp $
#
# service.sh - (c) 2004 Michel Blomgren
# for SENTINIX and/or Slackware style /etc/rc.d/rc.* scripts
#
# You may freely distribute this script under the terms of the
# GNU General Public License.
#
# usage: service
#

function check_rc_status {
    if [ ! -e $1 ]; then
        echo "error: $1 does not exist!"
        return 1
    fi
    if [ ! -r $1 ]; then
	echo "$1 is not readable!"
	return 1
    fi
    if [ ! -f $1 ]; then
        echo "warning: $1 is not a regular file!"
    fi
    if [ ! -x $1 ]; then
        echo "$1 is not executable!"
        return 1
    fi
}


if [ $# -lt 1 ]; then
    echo "usage: service name [start|stop|restart, etc.]"
    echo "to list services, type: service .list"
    exit 1
fi

SERVICE="$1"

if [ "$1" = ".list" -o "$1" = ".LIST" -o "$1" = ".List" ]; then
    for i in /etc/rc.d/rc.* ; do
	check_rc_status $i || continue
	echo "$i"
    done

    exit 0
fi

check_rc_status /etc/rc.d/rc.$SERVICE || exit 1

# shift all command line variables (remove $1 from command)
shift 1

exec /etc/rc.d/rc.$SERVICE $@
