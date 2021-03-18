#!/bin/sh

echo "" > /etc/motd
echo -e "HOSTNAME: $(hostname)" >> /etc/motd
echo -e "IP ADDRESSES:\n$( ip a | awk -F' ' '/inet / {print "\t" $NF ": " $2}' )" >> /etc/motd
echo  -e "CPU CORES: $(cat /proc/cpuinfo | grep 'cpu MHz' | wc -l)" >> /etc/motd
cat /proc/cpuinfo | grep 'cpu MHz' | sort -r | awk -F: 'NR==1{print "CPU MHz: " $2}' >> /etc/motd
cat /proc/meminfo | grep Mem | awk -F: '{gsub(/[ \t]+/, "", $2); print $1 ": " $2}' >> /etc/motd
