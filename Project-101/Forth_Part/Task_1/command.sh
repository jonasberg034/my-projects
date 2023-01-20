#!/bin/bash
ip=$(cat info.json | grep PrivateIpAddress | head -1 | cut -d":" -f2 | cut -d'"' -f2)

sed -i "s/ec2-private_ip/$(cat info.json | grep PrivateIpAddress | head -1 | cut -d":" -f2 | cut -d'"' -f2)/g" terraform.tf
