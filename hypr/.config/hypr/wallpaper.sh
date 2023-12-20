#!/bin/sh

if pgrep swaybg; then
	pkill swaybg
fi
swaybg -m fill -i ~/.cache/wallpaper

