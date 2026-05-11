#!/usr/bin/env bash

# I edit my nvim in the home directory for reload -> make sure they are synced
# before building
#cp -r /home/will/.config/nvim /home/will/nixos/sources/

sudo nixos-rebuild switch -I nixos-config=/home/will/nixos/configuration.nix
