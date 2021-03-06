#!/bin/bash
# The patch for the "failed to obtain tansaction lock" error is forthcoming
# according to issue #108
#  https://github.com/containers/fuse-overlayfs/issues/108
# 
# In the mean time run errata.sh as root, inside the user toolbox, before
# running the user.yml playbook.

[[ $(id -u) != 0 ]] && echo "Must be run as root. Exiting..." && exit 3

dnf install -y ansible cmake facter golang jq lvm2 openconnect python3-devel redhat-rpm-config ruby strace vim

