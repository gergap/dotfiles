#!/bin/bash
msg="$1"
notify-send --icon='/home/gergap/Pictures/neomutt.png' 'New Email' "$msg"
paplay --volume=30000 /usr/share/sounds/Oxygen-Im-New-Mail.ogg

