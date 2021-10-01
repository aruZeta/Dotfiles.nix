{ config
, lib
, pkgs
, ...
}:

{
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;

    # Sway config
    config = {
      modifier = "Mod4";
      menu = "${pkgs.wofi}/bin/wofi";
      terminal = "${pkgs.alacritty}/bin/alacritty";
      workspaceAutoBackAndForth = true;

      # TODO: reassign all default keybindings
      # left = "h";
      # down = "t";
      # up = "n";
      # right = "s";
      keybindings =
        let mod = config.wayland.windowManager.sway.config.modifier;
        in lib.mkOptionDefault {
          "${mod}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
          "${mod}+Shift+w" = "kill";
	  "${mod}+Escape" = "exec swaylock -f";
	  "${mod}+Shift+Escape" = "exec swaynag -t warning -m 'End session?' -b 'Yes, exit sway' 'swaymsg exit'";
          "Mod1+Space" = "exec ${pkgs.wofi}/bin/wofi --show drun";
	  "XF86MonBrightnessUp" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set +2%";
	  "XF86MonBrightnessDown" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 2%-";
        };

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
      };

      output = {
        "eDP-1" = {
	  resolution = "1366x768@60Hz";
	  position = "0,0";
	};
        "HDMI-A-1" = {
	  resolution = "1920x1080@60Hz";
	  position = "1366,0";
	};
      };

      startup = [
        { command =
	    ''
	      exec swayidle -w \
                timeout 300 'swaylock -f' \
                timeout 305 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' \
                before-sleep 'swaylock -f'
	    '';
	}
      ];
    };
  };
}