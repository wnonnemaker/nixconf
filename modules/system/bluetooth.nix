{ config, pkgs, ... }:
{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;        # Auto-power adapter on startup

    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
        Experimental = true;   # Enables battery level reporting, etc.
      };
    };
  };

  services.blueman.enable = true;
}
