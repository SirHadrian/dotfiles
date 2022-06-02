#!/bin/bash
set -e
file="/sys/class/backlight/amdgpu_bl0/brightness"
current=$(cat "$file")
max_brightness=255
min_brightness=10
mid_brightness=127
new="$current"
if [ "$1" = "--inc" ]
then
    new=$(( current + $2 ))
fi
if [ "$1" = "--dec" ]
then
    new=$(( current - $2 ))
fi
if [ "$1" = "--min" ]
then
    new=$min_brightness
fi
if [ "$1" = "--max" ]
then
    new=$max_brightness
fi
if [ "$1" = "--mid" ]
then
	new=$mid_brightness
fi

echo "$new" | tee "$file"
