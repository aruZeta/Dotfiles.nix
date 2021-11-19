{ lib
, pkgs
, ...
}:

{
  programs.waybar = {
    enable = true;
    style = lib.strings.fileContents ./style.css;

    settings = [{
      height = 30;
      layer = "top";
      margin = "5 5 0";
      modules-left = [ "sway/workspaces" "sway/window" ];
      modules-center = [ "clock" "idle_inhibitor" ];
      modules-right = [ "cpu" "memory" "backlight" "disk" "battery" "network" "pulseaudio" "temperature" ];

      modules =
        let big = text: "<span font='17' rise='-3000'>" + text + "</span>";
        in {
          "sway/workspaces" = {
            format = ''${big "{icon}"}'';

            format-icons = {
              "1" = "";
              "2" = ""; # I need an emacs icon
              "3" = "";
              "4" = ""; # There is no vbox icon
              "5" = "";
              "6" = "";
              "7" = "";
              "8" = ""; # Random stuff
              "9" = "ﭮ";
              "urgent" = "";
              "focused" = "";
              "default" = "";
            };
          };

          "sway/window" = {
            format = "{}";
            format-alt = ''${big ""}'';
            max-length = 80;
            tooltip = false;

            rewrite = {
              "(.*) — Mozilla Firefox" = ''${big ""} $1'';
              "(.*) — Mozilla Firefox \\(Private Browsing\\)" = ''${big " ﴣ"} $1'';
              "(.*) - GNU Emacs.*" = ''${big ""} $1'';
              "(.*) - Eclipse IDE.*" = ''${big ""} $1'';
              "(.*) - Oracle VM VirtualBox" = ''${big ""} $1'';
            };
          };

          clock = {
            interval = 1;
            format = ''{:%H:%M:%S} ${big ""}'';
            format-alt = ''{:%A %d, %B %Y} ${big ""}'';
            tooltip = false;
          };

          cpu = {
            interval = 5;
            format = ''${big " "}'';
            format-alt = ''{usage}% ${big ""}'';
            tooltip = false;
          };

          memory = {
            interval = 5;
            format = ''${big " "}'';
            format-alt = ''{used:0.1f}G/{total:0.1f}G ${big ""}'';
            tooltip = false;
          };

          backlight = {
            interval = 5;
            format = ''${big " {icon}"}'';
            format-alt = ''{percent}% ${big "{icon}"}'';
            format-icons = [ "" "" ];
            tooltip = false;
            on-scroll-up = "exec ${pkgs.brightnessctl}/bin/brightnessctl set +1%";
            on-scroll-down = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 1%-";
          };

          disk = {
            interval = 30;
            format = ''${big " "}'';
            format-alt = ''{used}/{total} ${big ""}'';
            path = "/";
            tooltip = false;
          };

          battery = {
            interval = 60;
            bat = "BAT1";
            format = ''${big " {icon}"}'';
            format-alt = ''{capacity}% ${big "{icon}"}'';
            format-icons = [ "" "" "" "" "" ];
            tooltip = false;
          };

          idle_inhibitor = {
            format = ''${big "{icon}"}'';
            tooltip = false;
            on-click-right = "exec swaylock -f";
            on-click-middle = "exec swayidle timeout 1 'swaylock -f' timeout 2 'swaymsg \"output * dpms off\"' resume 'swaymsg \"output * dpms on\" && pkill -n swayidle' before-sleep 'swaylock -f'";

            format-icons = {
              activated = "";
              deactivated = "";
            };
          };

          network = {
            interval = 5;
            format-wifi = ''${big " 直"}'';
            format-ethernet = ''${big " "}'';
            format-disconnected = ''${big ""}'';
            format-alt = ''{essid}: {ipaddr} | {bandwidthUpBits} ${big ""} {bandwidthDownBits} ${big ""}'';
            tooltip = false;
          };

          pulseaudio = {
            format = ''${big " {icon}"}'';
            format-muted = ''${big "  {icon}"}'';
            format-source-muted = ''${big "  {icon}"}'';
            format-alt = ''{volume}% {format_source} ${big "{icon}"}'';
            tooltip = false;
            on-click-right = "exec ${pkgs.pulseaudio}/bin/pactl set-sink-mute @DEFAULT_SINK@ toggle";
            on-click-middle = "exec ${pkgs.pavucontrol}/bin/pavucontrol";

            format-icons = {
              headphone = "";
              headset = "";
              hands-free = "";
              speaker = "蓼";
              hifi = "醙";
              hdmi = "﴿";
              phone = "";
              portable = "";
              car = "";
              default = [ "" "" "" ];
            };
          };

          temperature = {
            interval = 5;
            format = ''${big " {icon}"}'';
            format-alt = ''{temperatureC}°C ${big "{icon}"}'';
            format-icons = [ "" "" "" "" ];
            tooltip = false;
            critical-threshold = 80;
          };
        };
    }];
  };
}
