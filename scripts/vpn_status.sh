#! /bin/bash
status=$(ps -ef | sed 1d | grep "openvpn --config" | grep -v "sudo\|grep")
if [ -z "$status" ]
then
    echo "🔒VPN OFF"
else
    echo "🔒VPN ON"
fi
