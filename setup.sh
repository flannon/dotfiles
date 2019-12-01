#!/bin/bash
#

RPMFUSION=/etc/yum.repos.d/rpmfusion-free.repo

[[ $(id -u) != 0 ]] && echo "Must be run as root. Exiting..." && exit 3

# Talk to myself - configure sshd for localhost connectivity
sed -i 's/^#ListenAddress 0.0.0.0/ListenAddress 127.0.0.1/' /etc/ssh/sshd_config
sed -i 's/^#ListenAddress ::/ListenAddress ::1/' /etc/ssh/sshd_config
sed -i 's/^PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

# Set NOPASSWD on group wheel, if it's commented out.
[[ $(sudo grep "#\s%wheel\s\ALL=(ALL)\sNOPASSWD:\sALL" /etc/sudoers) ]] && \
  	sudo sed -i \
  	's/^#\s*\(%wheel\s\+ALL=(ALL)\s\+NOPASSWD:\s\+ALL\)/\1/' /etc/sudoers 

# Install rpmfusion
[[ ! -f $RPMFUSION ]]  && \
        rpm-ostree  install \
        https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
        https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm && \
        systemctl reboot

# update 
rpm-ostree update

# install compat-ffmpeg28 for video support for firefox
rpm-ostree install compat-ffmpeg28 gnome-tweak-tool strace --reboot

# Enable sshd
systemctl enable sshd
systemctl start sshd
