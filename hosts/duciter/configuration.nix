# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "duciter"; # Define your hostname.

  hardware.i2c.enable = true;

  swapDevices = [
    {
      device = "/swapfile";
      size = 16384; # 16GB
    }
  ];

  # Limit build parallelism to reduce peak memory during compilation
  nix.settings.max-jobs = 4;
  nix.settings.cores = 8;

  home-manager.users.will.services.syncthing = {
    settings.devices = {
      gunction = {
        name = "gunction";
        id = "Z2TP2ZH-SUU62IQ-HPHFXB5-4TOSLUQ-QZU7YPD-4N6NR5B-4CKSGHF-CNHMWQQ";
      };
    };
    settings.folders = {
      "projects" = {
        id = "projects";
        label = "projects";
        path = "/home/will/projects";
        devices = [ "gunction" ];
      };
      "desktop" = {
        id = "desktop";
        label = "desktop";
        path = "/home/will/desktop";
        devices = [ "gunction" ];
      };
    };
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

  home-manager.users.will.home.stateVersion = "25.11";

}
