#!/bin/sh

source sxconfig &&
cd openssh-$VERSION &&
make install &&
(
	# Ditch the new host keys, since these have to be uniquely prepared on each machine:
	rm -f /etc/ssh/ssh_host_dsa_key
	rm -f /etc/ssh/ssh_host_dsa_key.pub
	rm -f /etc/ssh/ssh_host_rsa_key
	rm -f /etc/ssh/ssh_host_rsa_key.pub
	rm -f /etc/ssh/ssh_host_key
	rm -f /etc/ssh/ssh_host_key.pub
)
