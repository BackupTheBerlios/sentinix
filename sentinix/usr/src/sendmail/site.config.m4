APPENDDEF(`confMAPDEF', `-DNEWDB -DSTARTTLS -DSASL -DTCPWRAPPERS -DNIS -DMAP_REGEX')
APPENDDEF(`confLIBS', `-lnsl -lssl -lcrypto -lsasl2 -lwrap -lm -ldb -lresolv')
APPENDDEF(`confINCDIRS', `-I/usr/include/sasl')
