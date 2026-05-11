#!/usr/bin/env bash
nvim --cmd "set rtp^=~/nixos/modules/terminal/nvim" -u ~/nixos/modules/terminal/nvim/init.lua "$@"

