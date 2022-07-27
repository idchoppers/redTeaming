#!/bin/sh

# Script creates a dnsmasq DNS server installation and configuration
# Useage: dnsSetup.sh "domain.example" "C2 server IP"

apt install dnsmasq -y
systemctl enable dnsmasq

echo "port=53
domain-needed
bogus-priv
strict-order
expand-hosts
domain=$1
server=1.1.1.1
server=1.0.0.1
address=/$1/127.0.0.1
address=/$1/172.25.150.48" > /etc/dnsmasq.conf

echo "nameserver 127.0.0.1" > /etc/resolv.conf

echo "127.0.0.1	localhost
127.0.0.1	nameserver
::1	ip6-localhost ip6-loopback
fe00::0	ip6-localnet
ff00::0	ip6-mcastprefix
ff02::1	ip6-allnodes
ff02::2	ip6-allrouters

$2	c2" > /etc/hosts

chattr +i /etc/resolv.conf

systemctl restart dnsmasq
