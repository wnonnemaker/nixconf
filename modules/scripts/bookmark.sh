#!/usr/bin/env bash

# bookmark whatever is currently in the system clipboard
wl-paste >> ~/nixos/modules/system/bookmarks.txt

notify-send -t 2000 "Bookmark saved" "$(wl-paste)"
