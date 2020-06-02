#! /bin/bash

df -h | grep -m 1 /disk1 | awk -F" " '{print "💽 " $3 "/" $2}'
