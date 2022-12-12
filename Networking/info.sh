#!/bin/bash

# get network information

ip=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1 -d'/')
dns=$(grep -E '^nameserver' /etc/resolv.conf | awk '{print $2}')
open_ports=$(netstat -tulpn | grep -E '^(tcp|udp)' | awk '{print $4}' | cut -f2 -d: | sort -un)

# this prints network information to the command line

echo "IP address: $ip"
echo "DNS servers: $dns"
echo "Open ports: $open_ports"

# Save network information to a file

echo "IP address: $ip" > network_info.txt
echo "DNS servers: $dns" >> network_info.txt
echo "Open ports: $open_ports" >> network_info.txt
