#!/bin/bash

isMute=$(/usr/bin/osascript -e 'output muted of (get volume settings)' )

if [ "$isMute" == "true" ]; then
  echo " VOL Muted"
elif [ "$isMute" == "missing value" ]; then
  echo " VOL External"
else
  curVolume=$(osascript -e 'output volume of (get volume settings)')
  echo " VOL $curVolume"
fi
