#!/usr/bin/env bash
year=$(date +%Y)
month=$(date +%B)
day=$(date +%d)
journal_dir="$HOME/projects/personal/journal/$year/$month"
mkdir -p "$journal_dir"
"${EDITOR:-nano}" "$journal_dir/$day.md"
