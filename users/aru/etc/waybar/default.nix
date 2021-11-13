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
      modules-left = [ "sway/workspaces" "sway/window" ];
      modules-center = [ "clock" "idle_inhibitor" ];
      modules-right = [ "cpu" "memory" "backlight" "disk" "battery" "network" "pulseaudio" "temperature" ];
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

	"sway/window" = {
	  format = "{}";
	  max-length = 80;
	  rewrite = {
	    "(.*) — Mozilla Firefox" = " $1";
	    "(.*) - GNU Emacs.*" = "<span font='17' rise='-3000'></span> $1";
	  };
	  tooltip = false;
	};

	clock = {
	  interval = 1;
	  format = "{:%H:%M:%S} <span font='17' rise='-3000'></span>";
	  format-alt = "{:%A %d, %B %Y} <span font='17' rise='-3000'></span>";
	  tooltip = false;
	};

	cpu = {
	  interval = 5;
	  format = "<span font='17' rise='-3000'> </span>";
	  format-alt = "{usage}% <span font='17' rise='-3000'></span>";
	  tooltip = false;
	};

	memory = {
	  interval = 5;
	  format = "<span font='17' rise='-3000'> </span>";
	  format-alt = "{used:0.1f}G/{total:0.1f}G <span font='17' rise='-3000'></span>";
	  tooltip = false;
	};

	backlight = {
	  interval = 5;
	  format = "<span font='17' rise='-3000'> {icon}</span>";
	  format-alt = "{percent}% <span font='17' rise='-3000'>{icon}</span>";
	  format-icons = [ "" "" ];
	  tooltip = false;
	};

	disk = {
	  interval = 30;
	  format = "<span font='17' rise='-3000'> </span>";
	  format-alt = "{used}/{total} <span font='17' rise='-3000'></span>";
	  path = "/";
	  tooltip = false;
	};

	battery = {
	  interval = 60;
	  bat = "BAT1";
	  format = "<span font='17' rise='-3000'> {icon}</span>";
	  format-alt = "{capacity}% <span font='17' rise='-3000'>{icon}</span>";
	  format-icons = [ "" "" "" "" "" ];
	  tooltip = false;
	};

	idle_inhibitor = {
	  format = "<span font='17' rise='-3000'>{icon}</span>";
	  format-icons = {
	    activated = "";
	    deactivated = "";
	  };
	  tooltip = false;
	};

	network = {
	  interval = 5;
	  format-wifi = "<span font='17' rise='-3000'> 直</span>";
	  format-ethernet = "<span font='17' rise='-3000'> </span>";
	  format-disconnected = "<span font='17' rise='-3000'></span>";
	  format-alt = "{essid}: {ipaddr} | {bandwidthUpBits} <span font='17' rise='-3000'></span> {bandwidthDownBits} <span font='17' rise='-3000'></span>";
	  tooltip = false;
	};

	pulseaudio = {
	  format = "<span font='17' rise='-3000'> {icon}</span>";
	  format-alt = "{volume}% {format_source} <span font='17' rise='-3000'>{icon}</span>";
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
	  tooltip = false;
	};

	temperature = {
	  interval = 5;
	  format = "<span font='17' rise='-3000'> {icon}</span>";
	  format-alt = "{temperatureC}°C <span font='17' rise='-3000'>{icon}</span>";
	  format-icons = [ "" "" "" "" ];
	  tooltip = false;
	  critical-threshold = 80;
	};
      };
    }];
  };
}
