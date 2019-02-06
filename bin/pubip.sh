#!/bin/bash

public_ip_address=$(wget -qO- http://checkip.amazonaws.com)

echo $public_ip_address
