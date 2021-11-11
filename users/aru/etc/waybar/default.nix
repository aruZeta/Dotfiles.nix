{ lib
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
      modules-left = [ "sway/workspaces" ];
      modules-center = [ "clock" ];
      modules-right = [ "cpu" "memory" "backlight" "disk" ];
      modules = {
        "sway/workspaces" = {
          format = "{icon}";
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

	clock = {
	  interval = 1;
	  format = "{:%H:%M:%S} <big></big>";
	  format-alt = "{:%A %d, %B %Y} <big></big>";
	  tooltip = false;
	};

	cpu = {
	  interval = 5;
	  format = "<big> </big>";
	  format-alt = "{usage}% <big></big>";
	  tooltip = false;
	};

	memory = {
	  interval = 5;
	  format = "<big> </big>";
	  format-alt = "{used:0.1f}G/{total:0.1f}G <big></big>";
	  tooltip = false;
	};

	backlight = {
	  interval = 5;
	  format = "<big> </big>";
	  format-alt = "{percent}% <big></big>";
	  tooltip = false;
	};

	disk = {
	  interval = 30;
	  format = "<big> </big>";
	  format-alt = "{used}/{total} <big></big>";
	  path = "/";
	  tooltip = false;
	};
      };
    }];
  };
}
