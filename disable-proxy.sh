#/usr/bin/env bash

STAT=`nmcli radio wifi`

if [ $STAT = 'disabled' ]; then
  echo 'Wireless network is disabled'
  exit 1
fi

DIR=`dirname $0`
ESSID=`iwconfig 2>/dev/null | grep -i 'ESSID:' | grep -oE '"[^"]+"' | grep -oE '[^"]*'`

echo ${ESSID}
nmcli con mod "${ESSID}" ipv4.ignore-auto-dns no
nmcli con mod "${ESSID}" -ipv4.dns 127.0.2.1
nmcli con mod "${ESSID}" ipv6.ignore-auto-dns no
nmcli con mod "${ESSID}" -ipv6.dns ::1
nmcli radio wifi off
nmcli radio wifi on
