#!/usr/bin/sharkwrapper
#
# sharkwrapper is a script wrapper for /bin/sh, it first extracts all webserver
# variables and places them in the environment (using the Shark CGI Function).
# Then it executes /bin/sh with the first argument (this script). See
# http://sharkcgi.sf.net for more information about the Shark CGI Function.
#
# This script is licensed under the GNU General Public License.
#
# /Michel Blomgren - May 2003

echo -ne "Content-type: text/html\n\n"

if [ "$REQUEST_METHOD" = "GET" ]; then
    if [ "$sharkg_community" = "" ]; then
	sharkg_community=public
    fi

    cat <<EOF
<html>
<head>
<title>SNMP Storage Devices</title>
</head>
<body>
<h1>SNMP Storage Devices</h1>
<form action=snmpstorage.cgi method=POST>
<table border=0 cellpadding=2 cellspacing=2>
<tr><td align=right>Hostname (or address):</td><td><input type=text name=address value="${sharkg_address}"></td></tr>
<tr><td align=right>SNMP community:</td><td><input type=text name=community value="${sharkg_community}"></td></tr>
<tr><td align=right>SNMP version:</td><td>
    <select name=snmpversion>
EOF

    if [ "$sharkg_snmpversion" = "1" ]; then
	echo "<option value=1 selected>1"
    else
	echo "<option value=1>1"
    fi

    if [ "$sharkg_snmpversion" = "2c" ]; then
        echo "<option value=2c selected>2c"
    else
        echo "<option value=2c>2c"
    fi

    if [ "$sharkg_snmpversion" = "3" ]; then
        echo "<option value=3 selected>3"
    else
        echo "<option value=3>3"
    fi

    cat <<EOF
</td></tr>
<tr><td align=right valign=top>Extra command line:</td><td align=left><input type=text name=xtraline value="${sharkg_xtraline}"><br>
<font size=1>Click <a href="snmpstorage.cgi?help&address=$sharkg_address&community=$sharkg_community&snmpversion=$sharkg_snmpversion&xtraline=$sharkg_xtraline">here</a> for help.</font>
<tr><td colspan=2>&nbsp;</td></tr>
<tr><td>&nbsp;</td><td><input type=submit value=" OK "> - List storage devices</td></tr>
</table>
</form>
EOF

    if printenv sharkg_help ; then
	echo "<hr>"
	echo "<pre>"
	/usr/bin/snmpwalk -h 2>&1
	echo "</pre>"
    fi

elif [ "$REQUEST_METHOD" = "POST" ]; then

    cat <<EOF
<html>
<head>
<title>SNMP Storage Devices</title>
</head>
<body>
<h1>SNMP Storage Devices</h1>
<form action=snmpstorage.cgi method=POST>
<table border=0 cellpadding=2 cellspacing=2>
<tr><td align=right>Hostname (or address):</td><td><input type=text name=address value="${sharkp_address}"></td></tr>
<tr><td align=right>SNMP community:</td><td><input type=text name=community value="${sharkp_community}"></td></tr>
<tr><td align=right>SNMP version:</td><td>
    <select name=snmpversion>
EOF

    if [ "$sharkp_snmpversion" = "1" ]; then
	echo "<option value=1 selected>1"
    else
	echo "<option value=1>1"
    fi

    if [ "$sharkp_snmpversion" = "2c" ]; then
        echo "<option value=2c selected>2c"
    else
        echo "<option value=2c>2c"
    fi

    if [ "$sharkp_snmpversion" = "3" ]; then
        echo "<option value=3 selected>3"
    else
        echo "<option value=3>3"
    fi

    cat <<EOF
</td></tr>
<tr><td align=right valign=top>Extra command line:</td><td align=left><input type=text name=xtraline value="${sharkp_xtraline}"><br>
<font size=1>Click <a href="snmpstorage.cgi?help&address=$sharkp_address&community=$sharkp_community&snmpversion=$sharkp_snmpversion&xtraline=$sharkp_xtraline">here</a> for help.</font>
<tr><td colspan=2>&nbsp;</td></tr>
<tr><td>&nbsp;</td><td><input type=submit value=" OK "> - List storage devices</td></tr>
</table>
</form>
<hr>
EOF

    if [ "$sharkp_address" = "" ]; then
	cat <<EOF
<b>Address can't be empty!</b>
<hr>
<font size=1><i>SENTINIX snmpstorage.cgi &copy; 2003 Michel Blomgren</i></font>
</body></html>
EOF
	exit 1
    fi

    if [ "$sharkp_snmpversion" = "1" -o "$sharkp_snmpversion" = "2c" ]; then
	SNMPWALK="/usr/bin/snmpwalk -v $sharkp_snmpversion -Ovq -c $sharkp_community $sharkp_xtraline $sharkp_address"
	SNMPGET="/usr/bin/snmpget -v $sharkp_snmpversion -Ovq -c $sharkp_community $sharkp_xtraline $sharkp_address"
    else
	SNMPWALK="/usr/bin/snmpwalk -v $sharkp_snmpversion -Ovq $sharkp_xtraline $sharkp_address"
	SNMPGET="/usr/bin/snmpget -v $sharkp_snmpversion -Ovq $sharkp_xtraline $sharkp_address"
    fi

    #
    # go ahead...
    #

    list=`$SNMPWALK HOST-RESOURCES-MIB::hrStorageIndex 2>&1`
    if [ ! $? -eq 0 ]; then
	echo "<font color="#ff0000">Error: $list</font>"
	echo "<hr><font size=1><i>SENTINIX snmpstorage.cgi &copy; 2003 Michel Blomgren</i></font></body></html>"
	exit 1
    fi

    cat <<EOF
<table border=1 cellpadding=2 cellspacing=2 width=70%>
<tr><td><b>Device Index</b></td><td><b>Description</b></td><td><b>Total space</b></td><td><b>Space left</b></td></tr>
EOF

    echo "$list" | while read LINE
    do
	DEVICEDESC=`$SNMPGET HOST-RESOURCES-MIB::hrStorageDescr.$LINE 2> /dev/null`
	if [ $? -eq 0 ]; then
	    DISKSIZE=`$SNMPGET HOST-RESOURCES-MIB::hrStorageSize.$LINE 2> /dev/null`
	    if [ ! $? -eq 0 ]; then
		DISKSIZE=0
	    fi

	    Result=`$SNMPGET HOST-RESOURCES-MIB::hrStorageAllocationUnits.$LINE 2> /dev/null`
	    if [ $? -eq 0 ]; then
		ALLOCUNITS=`echo $Result | cut -d' ' -f1 2>&1`
	    else
		ALLOCUNITS=0
	    fi

	    REALDISKSIZE=`bc <<EOF
(${DISKSIZE}*${ALLOCUNITS})*0.000001
EOF`
	    roundedREALDISKSIZE=`printf "%.0f" $REALDISKSIZE`

	    USEDSIZE=`$SNMPGET HOST-RESOURCES-MIB::hrStorageUsed.$LINE 2> /dev/null`
	    if [ $? -eq 0 ]; then
		roundedUSEDSIZE=`bc <<EOF
(${DISKSIZE}-${USEDSIZE})*${ALLOCUNITS}*0.000001
EOF`
	    else
		roundedUSEDSIZE=0
	    fi
	    roundedUSEDSIZE=`printf "%.0f" $roundedUSEDSIZE`

	    PERCENTFREE=`bc <<EOF
scale=4
(1-(${USEDSIZE}/${DISKSIZE}))*100
EOF`
	    PERCENTFREE=`printf "%.0f" $PERCENTFREE`

	    echo "<tr><td><font size=2>$LINE</font></td><td><font size=2>$DEVICEDESC</font></td><td align=right><font size=2>$roundedREALDISKSIZE MB</font></td><td align=right><font size=2>(${PERCENTFREE}%) $roundedUSEDSIZE MB</td></tr>"
	fi
    done

    echo "</table>"

else
    echo "REQUEST_METHOD \"$REQUEST_METHOD\" unknown"!
fi

echo "<hr>
<font size=1><i>SENTINIX snmpstorage.cgi &copy; 2003 Michel Blomgren</i></font>
</body></html>"
