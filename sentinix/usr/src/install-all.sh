#!/bin/sh
CWD=`pwd`

function execinstallsh() {
    #
    # this is intended as a recursive function, allow a user to retry a
    # failed compilation (in order to e.g. change something in a package's
    # install.sh file).
    #
    make -s
    if [ ! $? -eq 0 ]; then
        echo -ne "\033[0;31m$1 (seem to) have failed, continue anyway?\033[0m [(y)es (n)o (r)etry] "
        read x
	if [ "$x" = "y" -o "$x" = "Y" -o "$x" = "yes" -o "$x" = "YES" ]; then
	    echo -e "\033[0;33mOK, continuing!\033[0m"
	elif [ "$x" = "r" -o "$x" = "R" -o "$x" = "retry" -o "$x" = "RETRY" ]; then
	    echo -e "Retrying..."
    	    # recursive
	    execinstallsh $1
	else
	    echo -e "Aborting!"
	    exit 1
	fi
    fi
}

source sxconfig || exit 1
! [ "$SRC" ] && echo "SRC variable is fubar, check sxconfig!" && exit 1
#! [ "$SXARCH" ] && echo "SXARCH variable is fubar, check sxconfig!" && exit 1
#! [ "$SXSYSNAME" ] && echo "SXSYSNAME variable is fubar, check sxconfig!" && exit 1
#! [ "$SXARCHFLAGS" ] && echo "SXARCHFLAGS variable is fubar, check sxconfig!" && exit 1

#export SXARCH SXSYSNAME SXARCHFLAGS || exit 1


cat <<EOF

Please make sure MySQL isn't running. MySQL has to be started at the end of the
compilation process in order to install some default databases.

Press enter to continue or ctrl+c to abort...
EOF
read junk



# add current hostname to /etc/hosts, if it isn't already there:
if ! grep "`hostname`" /etc/hosts 1> /dev/null ; then
	hostsfile="`cat /etc/hosts 2> /dev/null`"
	echo "$hostsfile" | grep -v "`hostname`" > /etc/hosts
	echo "127.0.0.1	`hostname`.fubar `hostname`" >> /etc/hosts
fi

# clear screen
echo -ne "\033[2J\033[3;1H"

# calculate number of sources:
TOTALSRC=0
for i in $SRC
do
	let TOTALSRC=$TOTALSRC+1
done

CURRENTSRC=0
for i in $SRC
do
	let CURRENTSRC=$CURRENTSRC+1

	LINES=`stty size | cut -f1 -d' '`
	COLUMNS=`stty size | cut -f2 -d' '`

	echo -ne "\033[s"
	echo -ne "\033[0;0r"
	echo -ne "\033[1;1H\033[2K"
	echo -ne "\033[1;37mbuilding \033[1;33m$i\033[0m"
	let xcol=$COLUMNS-14
	PERCENTDONE=`calcpercent $CURRENTSRC $TOTALSRC`
	echo -ne "\033[1;${xcol}H\033[1;37m${PERCENTDONE}%\033[0m finished."

	echo -ne "\033[3;${LINES}r"
	echo -ne "\033[u"

	echo
	echo -e "\033[1;37mentering --> \033[1;36m$i\033[0m"
	echo

	cd $i || exit 1
	if [ ! -e SKIP ]; then
	    execinstallsh $i
	fi
	cd $CWD
done


echo
echo Done.
echo

echo -n "Compilation time (hh:mm:ss): "
HOURS=0
MINUTES=0
let MINUTES=$SECONDS/60
let REMSEC=$SECONDS%60
let HOURS=$MINUTES/60
let MINUTES=$MINUTES%60
echo -n "$HOURS:"
if [ $MINUTES -lt 10 ]; then
        echo -n "0"
fi
echo -n "$MINUTES:"
if [ $REMSEC -lt 10 ]; then
        echo -n "0"
fi
echo "$REMSEC"
echo

echo -ne "\033[s"
echo -ne "\033[0;0r"
echo -ne "\033[u"
