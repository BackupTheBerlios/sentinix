#!/usr/bin/sharkwrapper
#
# Netstat CGI front-end Copyright 2003 Michel Blomgren
# This script is licensed under the GNU General Public License.
#

if [ "$sharkg_q" = "" ]; then
    NETSTATCMD="/bin/netstat --timers --extend --extend --verbose"
    MSG="Open connections/sockets"
elif [ "$sharkg_q" = "unix" ]; then
    NETSTATCMD="/bin/netstat --unix --timers --extend --extend --verbose"
    MSG="Open Unix domain sockets"
elif [ "$sharkg_q" = "inet" ]; then
    NETSTATCMD="/bin/netstat --inet --timers --extend --extend --verbose"
    MSG="Open Internet connections"
elif [ "$sharkg_q" = "tcp" ]; then
    NETSTATCMD="/bin/netstat --tcp --timers --extend --extend --verbose"
    MSG="Open TCP connections"
elif [ "$sharkg_q" = "udp" ]; then
    NETSTATCMD="/bin/netstat --udp --timers --extend --extend --verbose"
    MSG="Open UDP sockets"
elif [ "$sharkg_q" = "raw" ]; then
    NETSTATCMD="/bin/netstat --raw --timers --extend --extend --verbose"
    MSG="Open raw sockets"
elif [ "$sharkg_q" = "route" ]; then
    NETSTATCMD="/bin/netstat --route --extend --extend --verbose"
    MSG="Kernel routing table"
elif [ "$sharkg_q" = "groups" ]; then
    NETSTATCMD="/bin/netstat --groups --extend --extend --verbose"
    MSG="Multicast group membership information (IPv4 and IPv6)"
elif [ "$sharkg_q" = "masquerade" ]; then
    NETSTATCMD="/bin/netstat --masquerade --timers --extend --extend --verbose"
    MSG="Masqueraded connections"
elif [ "$sharkg_q" = "statistics" ]; then
    NETSTATCMD="/bin/netstat --statistics --extend --extend --verbose"
    MSG="Protocol statistics"
fi

cat <<EOF
Content-type: text/html

<html>
<head>
<title>Netstat - $MSG</title>
</head>
<body>

<h2>Netstat - $MSG</h2>

<p>
<a href="javascript: window.location.reload();">Reload (re-run)</a>
</p>

<table border=0 cellpadding=5 cellspacing=0 width="100%" bgcolor="#e8e8e8">
<tr><td><pre><b>\$ $NETSTATCMD</b>

EOF

$NETSTATCMD 2> /tmp/netstat.cgi.$$

cat <<EOF
</pre></td></tr></table>
EOF

cat <<EOF
<h3>Netstat warnings (STDERR)</h3>
<table border=0 cellpadding=5 cellspacing=0 width="100%" bgcolor="#e8e8e8">
<tr><td>
EOF

echo -n "<pre>"
cat /tmp/netstat.cgi.$$ 2> /dev/null

cat <<EOF
</pre></td></tr></table>

<p>
<a href="javascript:history.go(-1)">&lt;&lt; go back</a>
</p>

<hr>
<font size=1><i>SENTINIX Netstat CGI front-end &copy; 2003 Michel Blomgren</i></font>
</body>
</html>
EOF

rm -f /tmp/netstat.cgi.$$ 2> /dev/null
