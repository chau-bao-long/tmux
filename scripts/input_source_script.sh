#! /bin/bash
inputSource=$(osascript -e 'tell application "System Events" to tell process "SystemUIServer" to get the value of the first menu bar item of menu bar 1 whose description is "text input"')
echo "🎹 $inputSource"
