#!/usr/bin/env bash
set -e

TARGET="$HOME/.config/nvim"
SOURCE="$HOME/nixos/sources/nvim"

rm -rf "$TARGET"
ln -s "$SOURCE" "$TARGET"
echo "Linked $TARGET -> $SOURCE"
