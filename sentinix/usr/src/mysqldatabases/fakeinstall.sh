#!/bin/sh

# fake an installwatch.log

echo "faking installwatch.log"
find /var/lib/mysql -type f -exec echo -e "3\topen\t{}\t#success" \; > installwatch.log
find /var/lib/mysql -type l -exec echo -ne "0\tsymlink\t" \; -exec sh -c 'echo -n `readlink {}`' \; -exec echo -e "\t{}\t#success" \; >> installwatch.log
