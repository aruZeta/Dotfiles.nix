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
      modules-right = [ "cpu" "memory" "backlight" "disk" "battery" ];
      modules = {
        "sway/workspaces" = {
          format = "<span font='17' rise='-3000'>{icon}</span>";
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
	  format = "{:%H:%M:%S} <span font='17' rise='-3000'></span>";
	  format-alt = "{:%A %d, %B %Y} <span font='17' rise='-3000'></span>";
	  tooltip = false;
	};

	cpu = {
	  interval = 5;
	  format = "<span font='17' rise='-3000'> </span>";
	  format-alt = "{usage}% <span font='17' rise='-3000'></span>";
	  tooltip = false;
	};

	memory = {
	  interval = 5;
	  format = "<span font='17' rise='-3000'> </span>";
	  format-alt = "{used:0.1f}G/{total:0.1f}G <span font='17' rise='-3000'></span>";
	  tooltip = false;
	};

	backlight = {
	  interval = 5;
	  format = "<span font='17' rise='-3000'> </span>";
	  format-alt = "{percent}% <span font='17' rise='-3000'></span>";
	  tooltip = false;
	};

	disk = {
	  interval = 30;
	  format = "<span font='17' rise='-3000'> </span>";
	  format-alt = "{used}/{total} <span font='17' rise='-3000'></span>";
	  path = "/";
	  tooltip = false;
	};

	battery = {
	  interval = 60;
	  bat = "BAT1";
	  format = "<span font='17' rise='-3000'> </span>";
	  format-alt = "{capacity}% <span font='17' rise='-3000'></span>";
	  tooltip = false;
	};
      };
    }];
  };
}
