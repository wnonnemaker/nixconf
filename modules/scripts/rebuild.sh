#!/usr/bin/env bash
hostname=$(hostname)
sudo nixos-rebuild switch --flake /home/will/nixos#$hostname
