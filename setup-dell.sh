#!/bin/bash
#
# Install broadcome wifi driver for dell 

[[ $(id -u) != 0 ]] && echo "Must be run as root. Exiting..." && exit 3

rpm-ostree install kmod-wl --reboot


