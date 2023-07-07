{ config
, pkgs
, lib
, usefulExpresions
, ...
} @ args:

let
  inherit (builtins)
    toString;
  inherit (config.wayland.windowManager.sway.config)
    modifier
    menu
    terminal;
  inherit (usefulExpresions)
    capitalize
    genSet';

  scripts = import ./scripts.nix args;
  sway-screenshot = "${scripts.sway-screenshot}/bin/sway-screenshot";
  sway-screenshot-full =
    "${scripts.sway-screenshot-full}/bin/sway-screenshot-full";
  sway-exit = "${scripts.sway-exit}/bin/sway-exit";
  swaylock = "${pkgs.swaylock}/bin/swaylock";
  brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";
  swayidle-sleep-timeout =
    "${scripts.swayidle-sleep-timeout}/bin/swayidle-sleep-timeout";
in

{
  windowManager.sway = {
    extraSessionCommands =
      lib.strings.fileContents ./insertions/extra-session-commands.sh;

    config = {
      keybindings = {
        "${modifier}+Return" = "exec ${terminal}";
        "${modifier}+t" = "floating toggle";
        "${modifier}+f" = "fullscreen toggle";
        "${modifier}+n" = "move workspace to output right";
        "${modifier}+Shift+s" = "exec ${sway-screenshot}";
        "${modifier}+s" = "exec ${sway-screenshot-full}";
        "${modifier}+Shift+w" = "kill";
        "${modifier}+Escape" = "exec ${swaylock} -f";
        "${modifier}+Shift+Escape" = "exec ${sway-exit}";
        "Mod1+Space" = "exec ${menu} --show drun";
        "XF86MonBrightnessUp" = "exec ${brightnessctl} set +2%";
        "XF86MonBrightnessDown" = "exec ${brightnessctl} set 2%-";
      } // genSet' ["left" "down" "up" "right"] [
        [ (val: "${modifier}+${capitalize val}")
          (val: "focus ${val}")
        ]
        [ (val: "${modifier}+Shift+${capitalize val}")
          (val: "move ${val}")
        ]
      ] // genSet' (lib.range 1 9) [
        [ (val: "${modifier}+${toString val}")
          (val: "workspace number ${toString val}")
        ]
        [ (val: "${modifier}+Shift+${toString val}")
          (val: "move container to workspace number ${toString val}")
        ]
      ];

      gaps = {
        inner = 5;
      };

      input = {
        "18003:1:foostan_Corne" = {
          xkb_layout = "us";
          xkb_numlock = "disabled";
        };

        "type:keyboard" = {
          xkb_layout = "dvorak";
          xkb_numlock = "enabled";
        };

        "type:touchpad" = {
          tap = "enabled";
        };
      };

      output = {
        "eDP-1" = {
          resolution = "1920x1080@144.001Hz";
          position = "0,0";
          scale = "1";
        };

        "HDMI-A-1" = {
          resolution = "1920x1080@60Hz";
          position = "1920,0";
        };

        "*" = {
          bg = "#1d2021 solid_color";
        };
      };

      startup = [
        { command = "${swayidle-sleep-timeout}";
        }
      ];

      bars = [{
        command = "${pkgs.waybar}/bin/waybar";
      }];

      colors = {
        background = "#1d2021";

        focused = {
          background = "#1d2021";
          border = "#3c3836";
          childBorder = "#3c3836";
          indicator = "#3c3836";
          text = "#ebdbb2";
        };

        focusedInactive = {
          background = "#1d2021";
          border = "#282828";
          childBorder = "#282828";
          indicator = "#282828";
          text = "#ebdbb2";
        };

        placeholder = {
          background = "#1d2021";
          border = "#282828";
          childBorder = "#282828";
          indicator = "#282828";
          text = "#ebdbb2";
        };

        unfocused = {
          background = "#1d2021";
          border = "#1d2021";
          childBorder = "#1d2021";
          indicator = "#1d2021";
          text = "#ebdbb2";
        };

        urgent = {
          background = "#1d2021";
          border = "#cc241d";
          childBorder = "#cc241d";
          indicator = "#cc241d";
          text = "#ebdbb2";
        };
      };

      assigns = {
        "1" = [
          { app_id = "firefox"; }
        ];

        "2" = [
          { app_id = "emacs"; }
          { app_id = "Eclipse"; }
          { app_id = "calibre-ebook-edit"; }
          { class = "NetBeans IDE 8.2"; }
        ];

        "3" = [
          { app_id = "Alacritty"; }
        ];

        "4" = [
          { class = "VirtualBox Manager"; }
          { class = "VirtualBox Machine"; }
          { class = "virt-manager"; }
        ];

        "5" = [
          { app_id = "luajit-2.1.0-beta3"; } # koreader
          { app_id = "calibre-ebook-viewer"; }
        ];

        "6" = [
          { app_id = "calibre-gui"; }
        ];

        "7" = [
          { app_id = "termusic"; }
          { class = "Spotify"; } # Not working
        ];

        "8" = [
          { app_id = "org.inkscape.Inkscape"; }
        ];

        "9" = [
          { class = "Slack"; }
        ];
      };

      workspaceOutputAssign = [
        # Browser, VBox, Reader, Music
        { workspace = "1"; output = "eDP-1 HDMI-A-1"; }
        { workspace = "4"; output = "eDP-1 HDMI-A-1"; }
        { workspace = "5"; output = "eDP-1 HDMI-A-1"; }
        { workspace = "7"; output = "eDP-1 HDMI-A-1"; }

        # Editor, Terminal, DB, Image Edition, Messages
        { workspace = "2"; output = "HDMI-A-1 eDP-1"; }
        { workspace = "3"; output = "HDMI-A-1 eDP-1"; }
        { workspace = "6"; output = "HDMI-A-1 eDP-1"; }
        { workspace = "8"; output = "HDMI-A-1 eDP-1"; }
        { workspace = "9"; output = "HDMI-A-1 eDP-1"; }
      ];

      modifier = "Mod4";
      menu = "${pkgs.wofi}/bin/wofi";
      terminal = "${pkgs.wezterm}/bin/wezterm";
      workspaceAutoBackAndForth = true;

      fonts = {
        names = [ "Iosevka" ];
        style = "Regular";
        size = 12.0;
      };

      window = {
        border = 2;
        titlebar = false;
      };
    };
  };
}
