#!/usr/bin/sharkwrapper
#
# sharkwrapper is a script wrapper for /bin/sh, it first extracts all webserver
# variables and places them in the environment (using the Shark CGI Function).
# Then it executes /bin/sh with the first argument (this script). See
# http://sharkcgi.sf.net for more information about the Shark CGI Function.
#
# This script is licensed under the GNU General Public License.
#
# /Michel Blomgren - Apr 2003

echo -ne "Content-type: text/html\n\n"

if [ "$REQUEST_METHOD" = "GET" ]; then
    if [ "$sharkg_community" = "" ]; then
	sharkg_community=public
    fi

    cat <<EOF
<html>
<head>
<title>snmpwalk frontend</title>
</head>
<body>
<h1>snmpwalk</h1>
<form action=snmpwalk.cgi method="POST">
<table border=0 cellpadding=0 cellspacing=0 width=700>
<tr><td width=50% valign=top>
    <table border=0 cellpadding=2 cellspacing=2 width=100%>
    <tr><td align=right>Hostname (or address):</td><td><input type=text name=address value="${sharkg_address}"></td></tr>
    <tr><td align=right>MIB search criteria:</td><td><input type=text name=mibsearch value="${sharkg_mibsearch}"></td></tr>
    </table>
</td><td width=50% valign=top>
    <table border=0 cellpadding=2 cellspacing=2 width=100%>
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
	</select>
    </td></tr>
    <tr><td align=right valign=top>Extra options:</td>
    <td align=left><font size=1>
EOF
    if [ ! "$sharkg_opt1" = "" ]; then
	echo "<input type=checkbox checked name=opt1 value=\"-On\"> Numerical OIDs (-On)<br>"
    else
	echo "<input type=checkbox name=opt1 value=\"-On\"> Numerical OIDs (-On)<br>"
    fi

    if [ ! "$sharkg_opt2" = "" ]; then
	echo "<input type=checkbox checked name=opt2 value=\"-Oq\"> Quick print for easier parsing (-Oq)<br>"
    else
	echo "<input type=checkbox name=opt2 value=\"-Oq\"> Quick print for easier parsing (-Oq)<br>"
    fi

    if [ ! "$sharkg_opt3" = "" ]; then
	echo "<input type=checkbox checked name=opt3 value=\"-Ov\"> Print values only, not OIDs (-Ov)"	
    else
	echo "<input type=checkbox name=opt3 value=\"-Ov\"> Print values only, not OIDs (-Ov)"	
    fi

    cat <<EOF
    </td></tr>
    <tr><td align=right valign=top>Extra command line:</td><td align=left><input type=text name=xtraline value="${sharkp_xtraline}"><br>
    <font size=1>Type "-h" for help.</font>
    </td></tr>
    <tr><td colspan=2>&nbsp;</td></tr>
    <tr><td>&nbsp;</td><td><input type=submit value=" OK "> - Run snmpwalk</td></tr>
    </table>
</td></tr>
</table>

</form>
<hr>
<font size=1><i>SENTINIX snmpwalk CGI front-end &copy; 2003 Michel Blomgren</i></font>
</body></html>
EOF

elif [ "$REQUEST_METHOD" = "POST" ]; then
    cat <<EOF
<html>
<head>
<title>snmpwalk frontend</title>
</head>
<body>
<h1>snmpwalk</h1>
<form action=snmpwalk.cgi method="POST">
<table border=0 cellpadding=0 cellspacing=0 width=700>
<tr><td width=50% valign=top>
    <table border=0 cellpadding=2 cellspacing=2 width=100%>
    <tr><td align=right>Hostname (or address):</td><td><input type=text name=address value="${sharkp_address}"></td></tr>
    <tr><td align=right>MIB search criteria:</td><td><input type=text name=mibsearch value="${sharkp_mibsearch}"></td></tr>
    </table>
</td><td width=50% valign=top>
    <table border=0 cellpadding=2 cellspacing=2 width=100%>
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
	</select>
    </td></tr>
    <tr><td align=right valign=top>Extra options:</td>
    <td align=left><font size=1>
EOF
    if [ ! "$sharkp_opt1" = "" ]; then
	echo "<input type=checkbox checked name=opt1 value=\"-On\"> Numerical OIDs (-On)<br>"
    else
	echo "<input type=checkbox name=opt1 value=\"-On\"> Numerical OIDs (-On)<br>"
    fi

    if [ ! "$sharkp_opt2" = "" ]; then
	echo "<input type=checkbox checked name=opt2 value=\"-Oq\"> Quick print for easier parsing (-Oq)<br>"
    else
	echo "<input type=checkbox name=opt2 value=\"-Oq\"> Quick print for easier parsing (-Oq)<br>"
    fi

    if [ ! "$sharkp_opt3" = "" ]; then
	echo "<input type=checkbox checked name=opt3 value=\"-Ov\"> Print values only, not OIDs (-Ov)"	
    else
	echo "<input type=checkbox name=opt3 value=\"-Ov\"> Print values only, not OIDs (-Ov)"	
    fi

    cat <<EOF
    </td></tr>
    <tr><td align=right valign=top>Extra command line:</td><td align=left><input type=text name=xtraline value="${sharkp_xtraline}"><br>
    <font size=1>Type "-h" for help.</font>
    </td></tr>
    <tr><td colspan=2>&nbsp;</td></tr>
    <tr><td>&nbsp;</td><td><input type=submit value=" OK "> - Run snmpwalk</td></tr>
    </table>
</td></tr>
</table>
</form>
<hr>
EOF
    echo -n "<pre>"

    if [ "$sharkp_snmpversion" = "1" -o "$sharkp_snmpversion" = "2c" ]; then
        if [ "$sharkp_community" = "" ]; then
    	    sharkp_community=public
	fi

	if [ "$sharkp_address" = "" -a ! "$sharkp_xtraline" = "-h" ]; then
	    cat <<EOF
</pre>
<b>Address can't be empty!</b>
<hr>
<font size=1><i>SENTINIX snmpwalk CGI front-end &copy; 2003 Michel Blomgren</i></font>
</body></html>
EOF
	    exit 1
	fi
	/usr/bin/snmpwalk -v $sharkp_snmpversion $sharkp_opt1 $sharkp_opt2 $sharkp_opt3 -m MIB:ALL -c $sharkp_community $sharkp_xtraline $sharkp_address $sharkp_mibsearch 2>&1
    else
	if [ "$sharkp_address" = "" -a ! "$sharkp_xtraline" = "-h" ]; then
	    cat <<EOF
</pre>
<b>Address can't be empty!</b>
<hr>
<font size=1><i>SENTINIX snmpwalk CGI front-end &copy; 2003 Michel Blomgren</i></font>
</body></html>
EOF
	    exit 1
	fi
	/usr/bin/snmpwalk -v $sharkp_snmpversion $sharkp_opt1 $sharkp_opt2 $sharkp_opt3 -m MIB:ALL $sharkp_xtraline $sharkp_address $sharkp_mibsearch 2>&1
    fi

    cat <<EOF
</pre>
<hr>
<font size=1><i>SENTINIX snmpwalk CGI front-end &copy; 2003 Michel Blomgren</i></font>
</body></html>
EOF

else
    echo "REQUEST_METHOD \"$REQUEST_METHOD\" unknown"!
fi
