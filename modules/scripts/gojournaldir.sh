#!/usr/bin/env bash
year=$(date +%Y)
month=$(date +%B)
journal_dir="$HOME/projects/personal/journal/$year/$month"
mkdir -p "$journal_dir"
cd "$journal_dir"
exec "$SHELL"
