#!/bin/sh
echo -ne "Content-type: text/html\n\n"

cat <<EOF
<html>
<head>
<title>arplist.cgi</title>
</head>
<body>

<h2>Local ARP cache, sockstat and ip_conntrack on ${HTTP_HOST} (${SERVER_ADDR})</h2>

<p>
<a href="javascript: window.location.reload();">Reload (re-run)</a>
</p>

<p>
<table bgcolor="#e0e0e0" border=0 cellpadding=10 cellspacing=0>
<tr><td>
EOF
echo -n "<pre>"

echo "\$ <b>/sbin/arp -nv</b>"
/sbin/arp -nv

echo
echo "\$ <b>/sbin/arp -v</b>"
/sbin/arp -v

cat <<EOF
</pre>
</td></tr></table>
</p>

<h3>/proc/net/sockstat</h3>

<p>
<table bgcolor="#e0e0e0" border=0 cellpadding=10 cellspacing=0>
<tr><td>
EOF
echo -n "<pre>"

cat /proc/net/sockstat

cat <<EOF
</pre>
</td></tr></table>
</p>

<h3>/proc/net/ip_conntrack</h3>

<p>
<table bgcolor="#e0e0e0" border=0 cellpadding=10 cellspacing=0>
<tr><td>
EOF
echo -n "<pre>"

if [ -f /proc/net/ip_conntrack ]; then
    cat /proc/net/ip_conntrack
else
    echo "/proc/net/ip_conntrack doesn't exist (you're probably not running the Netfilter connection tracker)."
fi

cat <<EOF
</pre>
</td></tr></table>
</p>

<p>
<a href="javascript:history.go(-1);">&lt;&lt; go back</a>
</p>

</body></html>
EOF
