#!/bin/sh
echo -ne "Content-type: text/html\n\n"

cat <<EOF
<html>
<head>
<title>uptime.cgi</title>
</head>
<body>
EOF

cat <<EOF
<h2>Uptime for <b>${HTTP_HOST}</b> (${SERVER_ADDR})</h2>

<p>
<a href="javascript: window.location.reload();">Reload (re-run)</a>
</p>

<p><small>
EOF

announceuptime

cat <<EOF
</small></p>

<p>
<table bgcolor="#e0e0e0" border=0 cellpadding=10 cellspacing=0 width="100%">
<tr><td>
EOF

echo -n "<pre>"

uname -a
uptime

cat <<EOF
</pre>
</td></tr></table>
</p>

<p>
<a href="javascript:history.go(-1);">&lt;&lt; go back</a>
</p>
EOF

echo "</body></html>"
