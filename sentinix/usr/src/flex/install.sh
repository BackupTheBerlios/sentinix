#!/bin/sh

source sxconfig &&
#cd flex-$VERSION &&
cd flex-2.5.4 &&
make install &&
ln -sf libfl.a /usr/lib/libl.a &&
cat > /usr/bin/lex <<EOF &&
#!/bin/sh
exec /usr/bin/flex -l $*
EOF
chmod 0755 /usr/bin/lex &&
chown root.root /usr/bin/lex
