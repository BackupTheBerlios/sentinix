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
<title>SNMP Inventory</title>
</head>
<body>
<h1>SNMP Inventory</h1>
<form action=snmpinventory.cgi method="POST">
<table border=0 cellpadding=0 cellspacing=0>
<tr><td width=100% valign=top>
    <table border=0 cellpadding=2 cellspacing=2 width=100%>
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
    <font size=1>Click <a href="snmpinventory.cgi?help&address=$sharkg_address&community=$sharkg_community&snmpversion=$sharkg_snmpversion&xtraline=$sharkg_xtraline">here</a> for help.</font>
    <tr><td colspan=2>&nbsp;</td></tr>
    <tr><td>&nbsp;</td><td><input type=submit value=" OK "> - Get process list</td></tr>
    </table>
</td></tr>
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
<title>SNMP Inventory</title>
</head>
<body>
<h1>SNMP Inventory</h1>
<form action=snmpinventory.cgi method="POST">
<table border=0 cellpadding=0 cellspacing=0>
<tr><td width=100% valign=top>
    <table border=0 cellpadding=2 cellspacing=2 width=100%>
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
    <font size=1>Click <a href="snmpinventory.cgi?help&address=$sharkp_address&community=$sharkp_community&snmpversion=$sharkp_snmpversion&xtraline=$sharkp_xtraline">here</a> for help.</font>
    <tr><td colspan=2>&nbsp;</td></tr>
    <tr><td>&nbsp;</td><td><input type=submit value=" OK "> - Get process list</td></tr>
    </table>
</td></tr>
</table>
</form>
<hr>
EOF

    if [ "$sharkp_snmpversion" = "1" -o "$sharkp_snmpversion" = "2c" ]; then
        if [ "$sharkp_address" = "" ]; then
    	    cat <<EOF
<b>Address can't be empty!</b>
<hr>
<font size=1><i>SENTINIX snmpinventory.cgi &copy; 2003 Michel Blomgren</i></font>
</body></html>
EOF
	    exit 1
        fi
	SNMPWALK="/usr/bin/snmpwalk -v $sharkp_snmpversion -Ovq -c $sharkp_community $sharkp_xtraline $sharkp_address"
	SNMPGET="/usr/bin/snmpget -v $sharkp_snmpversion -Ovq -c $sharkp_community $sharkp_xtraline $sharkp_address"
	SNMPGET2="/usr/bin/snmpget -v $sharkp_snmpversion -Ov -c $sharkp_community $sharkp_xtraline $sharkp_address"
    else
	if [ "$sharkp_address" = "" ]; then
    	    cat <<EOF
<b>Address can't be empty!</b>
<hr>
<font size=1><i>SENTINIX snmpinventory.cgi &copy; 2003 Michel Blomgren</i></font>
</body></html>
EOF
	    exit 1
	fi
	SNMPWALK="/usr/bin/snmpwalk -v $sharkp_snmpversion -Ovq $sharkp_xtraline $sharkp_address"
	SNMPGET="/usr/bin/snmpget -v $sharkp_snmpversion -Ovq $sharkp_xtraline $sharkp_address"
	SNMPGET2="/usr/bin/snmpget -v $sharkp_snmpversion -Ov $sharkp_xtraline $sharkp_address"

    fi

    #
    # First, print the process list
    #

    list=`$SNMPWALK HOST-RESOURCES-MIB::hrSWRunIndex 2>&1`
    if [ ! $? -eq 0 ]; then
	echo "<font color="#ff0000">Error: $list</font>"
	echo "<hr><font size=1><i>SENTINIX snmpinventory.cgi &copy; 2003 Michel Blomgren</i></font></body></html>"
	exit 1
    fi

    procload=`$SNMPWALK HOST-RESOURCES-MIB:hrProcessorLoad 2> /dev/null`
    if [ $? -eq 0 -a ! "$procload" = "" ]; then
	i=1
	echo "$procload" | while read LINE
	do
	    echo "<b>CPU #${i} load: $LINE</b><br>"
	    let i=${i}+1
	done
    fi

    if [ "$procload" = "" ]; then
	procload=`$SNMPGET UCD-SNMP-MIB::laLoad.1 UCD-SNMP-MIB::laLoad.2 UCD-SNMP-MIB::laLoad.3 2> /dev/null`
	if [ $? -eq 0 ]; then
	    procload1=`echo $procload | cut -d' ' -f1`
	    procload2=`echo $procload | cut -d' ' -f2`
	    procload3=`echo $procload | cut -d' ' -f3`
	    if [ ! "$procload1" = "" ]; then
		echo "<b>Load average @ $sharkp_address: $procload1, $procload2, $procload3</b>"
	    fi
	fi
    fi

    echo "<hr>"

    cat <<EOF
<h3>Process list - $sharkp_address</h3>
<table border=1 cellpadding=2 cellspacing=2 width=100%>
<tr>
<td><b>PID</b></td>
<td><b>Name</b></td>
<td><b>Run path</b></td>
<td><b>Parameters</b></td>
<td><b>Memory</b></td>
</tr>
EOF

    echo "$list" | while read LINE
    do
	snmpret=`$SNMPGET HOST-RESOURCES-MIB::hrSWRunName.$LINE HOST-RESOURCES-MIB::hrSWRunPath.$LINE HOST-RESOURCES-MIB::hrSWRunParameters.$LINE HOST-RESOURCES-MIB::hrSWRunPerfMem.$LINE 2> /dev/null`
	if [ $? -eq 0 ]; then
	    pid=$LINE
	    i=1
	    echo "<tr><td><font size=2>$pid</font></td>"
	    echo "$snmpret" | while read LINE2
	    do
		let i=$i+1
		if [ $i -eq 5 ]; then
		    echo -n "<td align=right><font size=2>$LINE2</font></td>"
		else
		    echo -n "<td><font size=2>$LINE2</font></td>"
		fi
	    done
	    echo "</tr>"
	fi
    done

    echo "</table>"


    cat <<EOF
<h3>Installed Software</h3>
EOF


    list=`$SNMPWALK HOST-RESOURCES-MIB::hrSWInstalledIndex 2> /dev/null`
    if [ $? = 0 -a ! "$list" = "" ]; then

	snmpret1=`$SNMPGET2 HOST-RESOURCES-MIB::hrSWInstalledLastChange.0 2> /dev/null`
	snmpret2=`$SNMPGET2 HOST-RESOURCES-MIB::hrSWInstalledLastUpdateTime.0 2> /dev/null`

	echo "<p>Last change: <b>$snmpret1</b><br>Last update: <b>$snmpret2</b><p>"

	cat <<EOF
<table border=1 cellpadding=2 cellspacing=2 width=100%>
<tr>
<td><b>Index</b></td>
<td><b>Name</b></td>
<td><b>Type</b></td>
<td><b>Date</b></td>
</tr>
EOF
	echo "$list" | while read LINE
	do
	    id=$LINE
	    installedname=`$SNMPGET HOST-RESOURCES-MIB::hrSWInstalledName.$LINE 2> /dev/null`
	    if [ $? = 0 -o ! "$installedname" = "" ]; then
		installedtype=`$SNMPGET HOST-RESOURCES-MIB::hrSWInstalledType.$LINE 2> /dev/null`
		installeddate=`$SNMPGET HOST-RESOURCES-MIB::hrSWInstalledDate.$LINE 2> /dev/null`

		if [ "$installedtype" = "" ]; then
		    installedtype=unknown
		fi

		if [ "$installeddate" = "" ]; then
		    installeddate=unknown
		fi

		cat <<EOF
<tr><td><font size=2>$LINE</font></td>
<td><font size=2>$installedname</font></td>
<td><font size=2>$installedtype</font></td>
<td><font size=2>$installeddate</font></td></tr>
EOF

	    fi
	done

	echo "</table>"
    else
	echo "<font size=2>Not applicable. This only works for Windows, $sharkp_address is probably not a Windows box.</font>"
    fi

    cat <<EOF
<h3>Hardware list - $sharkp_address</h3>
<table border=1 cellpadding=2 cellspacing=2 width=100%>
<tr>
<td><b>Device ID</b></td>
<td><b>Type</b></td>
<td><b>Description</b></td>
<td><b>Status</b></td>
<td><b>Errors</b></td>
</tr>
EOF

    list=`$SNMPWALK HOST-RESOURCES-MIB::hrDeviceIndex 2> /dev/null`
    echo "$list" | while read LINE
    do
	devid=$LINE
	snmpret=`$SNMPGET HOST-RESOURCES-MIB::hrDeviceType.$LINE HOST-RESOURCES-MIB::hrDeviceDescr.$LINE 2> /dev/null`
	if [ $? -eq 0 ]; then
	    type=`echo $snmpret | cut -d' ' -f1 | cut -c31-`
	    descr=`echo $snmpret | cut -d' ' -f2-`
	    status=`$SNMPGET HOST-RESOURCES-MIB::hrDeviceStatus.$LINE 2> /dev/null`
	    errors=`$SNMPGET HOST-RESOURCES-MIB::hrDeviceErrors.$LINE 2> /dev/null`
	    if [ "$status" = "" ]; then
		status=unknown
	    fi
	    if [ "$errors" = "" ]; then
		errors="N/A"
	    fi
	    echo "<tr><td><font size=2>$devid</font></td><td><font size=2>$type</font></td><td><font size=2>$descr</font></td><td><font size=2>$status</font></td><td><font size=2>$errors</font></td></tr>"
	fi
    done
    echo "</table>"

else
    echo "REQUEST_METHOD \"$REQUEST_METHOD\" unknown"!
fi

    cat <<EOF
<hr>
<font size=1><i>SENTINIX snmpinventory.cgi &copy; 2003 Michel Blomgren</i></font>
</body></html>
EOF
