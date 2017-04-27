#!/usr/bin/env bash

HOSTNAME=$1

if [[ -z "$1" ]]
then
  echo "Usage: $0 <hostname>"
else
  aws ec2 describe-instances \
  --filters "Name=tag:Name,Values=${HOSTNAME}" \
  | grep -i -m1 publicdnsname | head -1 | cut -d: -f2 | cut -d\" -f2
fi
