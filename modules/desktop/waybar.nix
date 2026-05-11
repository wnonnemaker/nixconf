{ config, pkgs, ... }:
let
  icons = {
    calendar = "󰃭 ";
    clock = " ";
    battery = {
      charging = "󱐋";
      levels = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
    };
    network = {
      disconnected = "󰤮 ";
      ethernet = "󰈀 ";
      strength = [ "󰤟 " "󰤢 " "󰤥 " "󰤨 " ];
    };
    bluetooth = {
      on = "󰂯";
      off = "󰂲";
      battery = "󰥉";
    };
    volume = {
      source = "󱄠";
      muted = "󰝟";
      levels = [ "󰕿" "󰖀" "󰕾" ];
    };
  };
in
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        modules-left = [ "wireplumber" "wireplumber#source" ];
        modules-center = [ "clock#date" "clock" ];
        modules-right = [ "network" "bluetooth" "bluetooth#battery" "battery" ];

        battery = {
          interval = 5;
          format = "{icon}  {capacity}%";
          format-charging = "{icon}  {capacity}% ${icons.battery.charging}";
          format-icons = icons.battery.levels;
          states = {
            warning = 30;
            critical = 15;
          };
        };

        clock = {
          interval = 1;
          format = "${icons.clock} {:%I:%M %p}";
        };

        "clock#date" = {
          format = "${icons.calendar} {:%m-%d-%Y}";
        };

        network = {
          tooltip-format = "{ifname}";
          format-disconnected = icons.network.disconnected;
          format-ethernet = icons.network.ethernet;
          format-wifi = "{icon} {essid}";
          format-icons = icons.network.strength;
        };

        bluetooth = {
          format = "{icon}";
          format-disabled = "";
          format-icons = {
            on = icons.bluetooth.on;
            off = icons.bluetooth.off;
            connected = icons.bluetooth.on;
          };
          format-connected = "{icon} {device_alias}";
        };

        "bluetooth#battery" = {
          format = "";
          format-connected-battery = "${icons.bluetooth.battery} {device_battery_percentage}%";
        };

        wireplumber = {
          format = "{icon} {volume}%";
          format-muted = "${icons.volume.muted} {volume}%";
          format-icons = icons.volume.levels;
          reverse-scrolling = 1;
          tooltip = false;
        };

        "wireplumber#source" = {
          format = "${icons.volume.source} {node_name}";
          tooltip = false;
        };
      };
    };
    style = ''
      * {
          border: none;
          font-family: "JetBrains Mono";
          font-size: 14px;
          color: #cdd6f4;
      }

      window#waybar {
          background: transparent;
      }

      .modules-left, .modules-center, .modules-right {
          background: transparent;
          margin: 3px 10px;
      }

      .modules-left > * > *,
      .modules-center > * > *,
      .modules-right > * > * {
          margin: 3px 1px;
          padding: 5px 7px;
          background: #1e1e2e;
      }

      .modules-left > :first-child > *,
      .modules-center > :first-child > *,
      .modules-right > :first-child > * {
          padding-left: 10px;
          border-top-left-radius: 20px;
          border-bottom-left-radius: 20px;
      }

      .modules-left > :last-child > *,
      .modules-center > :last-child > *,
      .modules-right > :last-child > * {
          padding-right: 10px;
          border-top-right-radius: 20px;
          border-bottom-right-radius: 20px;
      }

      .modules-left > :not(:first-child) > *,
      .modules-center > :not(:first-child) > *,
      .modules-right > :not(:first-child) > * {
          border-top-left-radius: 3px;
          border-bottom-left-radius: 3px;
      }

      .modules-left > :not(:last-child) > *,
      .modules-center > :not(:last-child) > *,
      .modules-right > :not(:last-child) > * {
          border-top-right-radius: 3px;
          border-bottom-right-radius: 3px;
      }

      #battery.charging {
          color: #a6e3a1;
      }

      #battery.warning:not(.charging) {
          color: #f9e2af;
      }

      #battery.critical:not(.charging) {
          animation: critical-blink steps(8) 1s infinite alternate;
      }

      @keyframes critical-blink {
          to {
              color: #fab387;
          }
      }
    '';
  };
}
