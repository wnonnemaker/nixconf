#!/usr/bin/env bash
rm -f /tmp/fzf-result

alacritty --class fzf-picker -e sh -c \
  'fzf --reverse --border --prompt "bookmark: " < ~/nixos/modules/system/bookmarks.txt > /tmp/fzf-result'

if [ -f /tmp/fzf-result ] && [ -s /tmp/fzf-result ]; then
  SELECTED=$(cat /tmp/fzf-result)
  rm -f /tmp/fzf-result
  wl-copy "$SELECTED"
  echo -n "$SELECTED" | xclip -selection clipboard 2>/dev/null
  notify-send "Bookmark copied" "$SELECTED is in the system clipboard"
fi
