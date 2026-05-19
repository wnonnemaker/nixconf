#!/usr/bin/env bash

#first get the text in clipboard
wtype -M ctrl -k c -m ctrl

wl-paste >> ~/nixos/modules/system/bookmarks.txt

notify-send -t 2000 "Bookmark saved" "$(wl-paste)"
