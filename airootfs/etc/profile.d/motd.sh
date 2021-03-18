#!/bin/sh

echo "" > /etc/motd
echo -e "HOSTNAME:\n$(hotname)" >> /etc/motd
echo -e "IP ADDRESSES:\n$(ip a | grep inet | cut -d ' ' -f6)" >> /etc/motd
echo  -e "CPU CORES: $(cat /proc/cpuinfo | grep 'cpu MHz' | wc -l)" >> /etc/motd
cat /proc/cpuinfo | grep 'cpu MHz' | sort -r | head -1 >> /etc/motd
cat /proc/meminfo | grep Mem >> /etc/motd
cat /proc/meminfo | grep 'Swap(T|F)'>> /etc/motd
