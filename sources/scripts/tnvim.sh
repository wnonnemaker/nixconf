#!/usr/bin/env bash
nvim --cmd "set rtp^=~/nixos/sources/nvim" -u ~/nixos/sources/nvim/init.lua "$@"

