#! /bin/bash
lang=$(osascript -e 'tell application "System Events" to tell process "SystemUIServer" to get the value of the first menu bar item of menu bar 1 whose description is "text input"')
echo "🎹$lang"
