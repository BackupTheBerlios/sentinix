#!/bin/sh
echo -ne "Content-type: text/html\n\n"

cat <<EOF
<html>
<head>
<title>cpuinfo.cgi</title>
</head>
<body>

<h2>/proc/cpuinfo for ${HTTP_HOST} (${SERVER_ADDR})</h2>

<p>
<table bgcolor="#e0e0e0" border=0 cellpadding=10 cellspacing=0>
<tr><td>
EOF

echo -n "<pre>"
cat /proc/cpuinfo

cat <<EOF
</pre>
</td></tr></table>
</p>

<p>
<a href="javascript:history.go(-1);">&lt;&lt; go back</a>
</p>

</body></html>
EOF
