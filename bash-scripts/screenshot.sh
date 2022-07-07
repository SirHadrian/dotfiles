#!/bin/bash

timestamp="$(date +%Y%m%d%H%M%S)"
targetbase="$HOME/Pictures/screenshots"
mkdir -p $targetbase
[ -d $targetbase ] || exit 1
scrot --silent $targetbase/$timestamp.png

