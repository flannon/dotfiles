#!/bin/bash
#
[[ $(id -u) != 0 ]] && echo "Must be run as root. Exiting..." && exit 3

[[ $1 == "--rollback" || $1 == "-r" ]] && \
	rpm-ostree rollback && \
	systemctl reboot && \
	exit 0

# Talk to myself - configure sshd for localhost connectivity
sed -i 's/^#ListenAddress 0.0.0.0/ListenAddress 127.0.0.1/' /etc/ssh/sshd_config
sed -i 's/^#ListenAddress ::/ListenAddress ::1/' /etc/ssh/sshd_config
sed -i 's/^PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

# Set NOPASSWD on group wheel, if it's commented out.
[[ $(sudo grep "#\s%wheel\s\ALL=(ALL)\sNOPASSWD:\sALL" /etc/sudoers) ]] && \
  	sudo sed -i \
  	's/^#\s*\(%wheel\s\+ALL=(ALL)\s\+NOPASSWD:\s\+ALL\)/\1/' /etc/sudoers 

# Enable sshd
systemctl enable sshd
systemctl start sshd
