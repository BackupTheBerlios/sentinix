APPENDDEF(`confMAPDEF', `-DNEWDB -DSTARTTLS -DTCPWRAPPERS -DNIS -DMAP_REGEX')
APPENDDEF(`confLIBS', `-lnsl -lssl -lcrypto -lwrap -lm -ldb -lresolv')
