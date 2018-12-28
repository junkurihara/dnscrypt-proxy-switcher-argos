#!/usr/bin/env bash

ICON=":lock:"
STAT=`nmcli radio wifi`
if [ $STAT = 'disabled' ]; then
  ICON=":no_entry_sign:"
else
  LINE=`nmcli device show |grep "IP4.DNS" | grep "127.0.2.1"| wc -l`
  if [ $LINE = 0 ]; then
    ICON=":scream:"
  else
    ICON=":lock:"
  fi
fi

DIR=`dirname $0`
ESSID=`iwconfig 2>/dev/null | grep -i 'ESSID:' | grep -oE '"[^"]+"' | grep -oE '[^"]*'`


echo ${ICON}
echo "---"
echo ":lock: Enable DNSCrypt-Proxy | bash='bash ${DIR}/enable-proxy.sh' terminal=false refresh=true"
echo ":scream: Disable DNSCrypt-Proxy | bash='bash ${DIR}/disable-proxy.sh' terminal=false refresh=true"

