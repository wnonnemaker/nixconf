#!/usr/bin/env bash

#first get the text in clipboard
wtype -M ctrl -k l -m ctrl -s 100 -M ctrl -k c -m ctrl

wl-paste >> ~/nixos/modules/system/bookmarks
