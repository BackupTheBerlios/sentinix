#!/bin/sh
echo -ne "Content-type: text/html\n\n"

cat <<EOF
<html>
<head>
<title>mps.cgi</title>
</head>
<body>

<h2>mps output from ${HTTP_HOST} (${SERVER_ADDR})</h2>

<p>
<a href="javascript: window.location.reload();">Reload (re-run)</a>
</p>

<p>
<table bgcolor="#e0e0e0" border=0 cellpadding=10 cellspacing=0>
<tr><td>
EOF
echo -n "<pre>"

echo "<b>$ mps auxww --sort:-utime</b>"
echo

mps auxww --sort:-utime

cat <<EOF
</pre>
</td></tr></table>
</p>

<p>
<a href="javascript:history.go(-1);">&lt;&lt; go back</a>
</p>

</body></html>
EOF
