#!/usr/bin/sharkwrapper
echo -ne "Content-type: text/html\r\n\r\n"

if [ "$sharkg_q" = "extended" ]; then
    cat <<EOF
<html>
<head>
<title>SENTINIX web-interface connection</title>
</head>
<body>
EOF

fi

if [ ! "$HTTPS" = "" ]; then

echo "<p>"
echo -n "You are connected over <b>$SSL_PROTOCOL</b>"

    if [ "$SSL_CLIENT_VERIFY" = "SUCCESS" ]; then
	echo " and <span style=\"background-color: #000000; color: #00ff00;\"><b>your certificate has been successfully identified and verified!</b></span>"
    elif [ "$SSL_CLIENT_VERIFY" = "NONE" ]; then
	echo ", but <span style=\"background-color: #000000; color: #ffff00;\"><b>you did not require to present a verified certificate in order to connect</b></span> (client verification is off)!"
	echo "<b>Make sure this interface is only accessible by people you trust!</b>"
	echo "This is best achieved with TLS/SSL Client Authentication, but Apache's mod_access methods or a firewall may be sufficient."
    else
	echo ", but <span style=\"background-color: #000000; color: #ff0000;\"><b>verification of your certificate failed!</b></span>"
    fi

    cat <<EOF
As a security precaution, make sure internal links start
with <tt><b>https://</b></tt> and <u>not</u> <tt><b>http://</b></tt>.
Below are some details about your connection.
</p>
<p>
<table border=0 cellpadding=2 cellspacing=2 width="100%" bgcolor="#e0e0e0">
EOF

if [ "$sharkg_q" = "extended" ]; then
    echo "<tr><td colspan=2><h4>Connection information:</h4></td></tr>"
fi

if [ ! "$SSL_CLIENT_VERIFY" = "" -a "$sharkg_q" = "extended" ]; then
    echo "<tr><td align=right valign=top>Client verified state:</td><td valign=top>$SSL_CLIENT_VERIFY</td></tr>"
fi
cat <<EOF
<tr><td align=right valign=top>Your&nbsp;address:</td><td valign=top>$REMOTE_ADDR</td></tr>
<tr><td align=right valign=top>Server&nbsp;address:</td><td valign=top>$SERVER_ADDR ($HTTP_HOST)</td></tr>
<tr><td align=right valign=top>Browser:</td><td valign=top>$HTTP_USER_AGENT</td></tr>
<tr><td align=right valign=top>SSL&nbsp;protocol:</td><td valign=top><b>$SSL_PROTOCOL</b></td></tr>
<tr><td align=right valign=top>SSL&nbsp;cipher:</td><td valign=top>$SSL_CIPHER, $SSL_CIPHER_USEKEYSIZE bit</td></tr>
<tr><td align=right valign=top>Server&nbsp;software:</td><td valign=top><b>$SERVER_SOFTWARE</b></td></tr>
EOF

if [ "$sharkg_q" = "extended" ]; then
# if extended querry
    cat <<EOF
<tr><td colspan=2>&nbsp;</td></tr>
<tr><td colspan=2><h4>Server Certificate issued to:</h4></td></tr>
<tr><td align=right valign=top>Country (C):</td><td valign=top>$SSL_SERVER_S_DN_C</td></tr>
<tr><td align=right valign=top>State (ST):</td><td valign=top>$SSL_SERVER_S_DN_ST</td></tr>
<tr><td align=right valign=top>Locality (L):</td><td valign=top>$SSL_SERVER_S_DN_L</td></tr>
<tr><td align=right valign=top>Organization (O):</td><td valign=top>$SSL_SERVER_S_DN_O</td></tr>
<tr><td align=right valign=top>Organizational Unit (OU):</td><td valign=top>$SSL_SERVER_S_DN_OU</td></tr>
<tr><td align=right valign=top>Common Name (CN):</td><td valign=top>$SSL_SERVER_S_DN_CN</td></tr>
<tr><td align=right valign=top>E-mail (E):</td><td valign=top>$SSL_SERVER_S_DN_Email</td></tr>
<tr><td colspan=2>&nbsp;</td></tr>
<tr><td colspan=2><h4>Server Certificate issued by:</h4></td></tr>
<tr><td align=right valign=top>Country (C):</td><td valign=top>$SSL_SERVER_I_DN_C</td></tr>
<tr><td align=right valign=top>State (ST):</td><td valign=top>$SSL_SERVER_I_DN_ST</td></tr>
<tr><td align=right valign=top>Locality (L):</td><td valign=top>$SSL_SERVER_I_DN_L</td></tr>
<tr><td align=right valign=top>Organization (O):</td><td valign=top>$SSL_SERVER_I_DN_O</td></tr>
<tr><td align=right valign=top>Organizational Unit (OU):</td><td valign=top>$SSL_SERVER_I_DN_OU</td></tr>
<tr><td align=right valign=top>Common Name (CN):</td><td valign=top>$SSL_SERVER_I_DN_CN</td></tr>
<tr><td align=right valign=top>E-mail (E):</td><td valign=top>$SSL_SERVER_I_DN_Email</td></tr>
EOF

if [ "$SSL_CLIENT_VERIFY" = "SUCCESS" ]; then
    cat <<EOF
<tr><td colspan=2>&nbsp;</td></tr>
<tr><td colspan=2><h4>Client Certificate issued to:</h4></td></tr>
<tr><td align=right valign=top>Country (C):</td><td valign=top>$SSL_CLIENT_S_DN_C</td></tr>
<tr><td align=right valign=top>State (ST):</td><td valign=top>$SSL_CLIENT_S_DN_ST</td></tr>
<tr><td align=right valign=top>Locality (L):</td><td valign=top>$SSL_CLIENT_S_DN_L</td></tr>
<tr><td align=right valign=top>Organization (O):</td><td valign=top>$SSL_CLIENT_S_DN_O</td></tr>
<tr><td align=right valign=top>Organizational Unit (OU):</td><td valign=top>$SSL_CLIENT_S_DN_OU</td></tr>
<tr><td align=right valign=top>Common Name (CN):</td><td valign=top>$SSL_CLIENT_S_DN_CN</td></tr>
<tr><td align=right valign=top>E-mail (E):</td><td valign=top>$SSL_CLIENT_S_DN_Email</td></tr>
<tr><td colspan=2>&nbsp;</td></tr>
<tr><td colspan=2><h4>Client Certificate issued by:</h4></td></tr>
<tr><td align=right valign=top>Country (C):</td><td valign=top>$SSL_CLIENT_I_DN_C</td></tr>
<tr><td align=right valign=top>State (ST):</td><td valign=top>$SSL_CLIENT_I_DN_ST</td></tr>
<tr><td align=right valign=top>Locality (L):</td><td valign=top>$SSL_CLIENT_I_DN_L</td></tr>
<tr><td align=right valign=top>Organization (O):</td><td valign=top>$SSL_CLIENT_I_DN_O</td></tr>
<tr><td align=right valign=top>Organizational Unit (OU):</td><td valign=top>$SSL_CLIENT_I_DN_OU</td></tr>
<tr><td align=right valign=top>Common Name (CN):</td><td valign=top>$SSL_CLIENT_I_DN_CN</td></tr>
<tr><td align=right valign=top>E-mail (E):</td><td valign=top>$SSL_CLIENT_I_DN_Email</td></tr>
EOF
fi

    cat <<EOF
<tr><td colspan=2>&nbsp;</td></tr>
<tr><td colspan=2>Certificate was issued <b>$SSL_SERVER_V_START</b></td></tr>
<tr><td colspan=2>Certificate expires <b>$SSL_SERVER_V_END</b></td></tr>
EOF

else
# if not extended querry
    cat <<EOF
<tr><td colspan=2 align=right><a href="${SCRIPT_NAME}?q=extended">More info &gt;&gt;</a></td></tr>
EOF
fi
    cat <<EOF
</table>
</p>
EOF

else

    cat <<EOF
<p>
<blink><font color="#ff0000"><b>WARNING!</b></font></blink> You are not communicating through a secure channel!
Please consider to configure connectivity to this interface through TLS/SSL (HTTPS) and not HTTP.
</p>
<p>
<table border=0 cellpadding=2 cellspacing=2 width="100%" bgcolor="#e0e0e0">
EOF

if [ "$sharkg_q" = "extended" ]; then
    echo "<tr><td colspan=2><h4>Connection information:</h4></td></tr>"
fi

    cat <<EOF
<tr><td align=right valign=top>Your&nbsp;address:</td><td valign=top>$REMOTE_ADDR</td></tr>
<tr><td align=right valign=top>Server&nbsp;address:</td><td valign=top>$SERVER_ADDR ($HTTP_HOST)</td></tr>
<tr><td align=right valign=top>Browser:</td><td valign=top>$HTTP_USER_AGENT</td></tr>
<tr><td align=right valign=top>Server&nbsp;software:</td><td valign=top><b>$SERVER_SOFTWARE</b></td></tr>
EOF

if [ ! "$sharkg_q" = "extended" ]; then
# if not extended querry
    cat <<EOF
<tr><td colspan=2 align=right><a href="${SCRIPT_NAME}?q=extended">More info &gt;&gt;</a></td></tr>
EOF
fi

    cat <<EOF
</table>
</p>
EOF
fi

if [ "$sharkg_q" = "extended" ]; then
    cat <<EOF
<p>
<a href="javascript:history.go(-1)">&lt;&lt; go back</a>
</p>
</body>
</html>
EOF
fi


#HTTPS=on   (if we're in https)

#SSL_VERSION_LIBRARY=OpenSSL/0.9.7b

#SSL_CIPHER
#SSL_PROTOCOL  (SSLv3)

#SSL_CIPHER_USEKEYSIZE - bits

