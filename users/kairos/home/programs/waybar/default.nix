{ pkgs
, ...
} @ args:

let
  lessBig = text: "<span font='10' rise='-10000'>" + text + "</span>";
  big = text: "<span font='12' rise='-2500'>" + text + "</span>";
  scripts = import ./scripts.nix args;
in

{
  style = ./symlinked/style.css;
  
  settings = [{
    height = 30;
    layer = "top";
    margin = "5 5 0";
    
    modules-left = [
      "sway/workspaces"
      "sway/window"
    ];
    
    modules-center = [
      "clock"
      "idle_inhibitor"
    ];
    
    modules-right = [
      "cpu"
      "memory"
      "backlight"
      "disk"
      "battery"
      "network"
      "pulseaudio"
      "temperature"
    ];
    
    "sway/workspaces" = {
      format = ''${big "{icon}"}'';
      
      format-icons = {
        "1" = "";
        "2" = ""; # I need an emacs icon # Edit: THE LORDS HAVE LISTENED TO MEEE
        "3" = "󰞷";
        "4" = "";
        "5" = "";
        "6" = "";
        "7" = "";
        "8" = "";
        "9" = "󰒱";
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
        "(.*) - GNU Emacs.*" = ''${big ""} $1'';
      };
    };
    
    clock = {
      interval = 1;
      format = ''{:%H:%M:%S} ${big ""}'';
      format-alt = ''{:%A %d, %B %Y} ${big "󰃭"}'';
      tooltip = false;
    };
    
    idle_inhibitor = {
      format = ''${lessBig "{icon}"}'';
      on-click-right = "exec swaylock -f";
      on-click-middle = "${scripts.swayidle-sleep-now}/bin/swayidle-sleep-now";
      tooltip = false;
      
      format-icons = {
        activated = " ";
        deactivated = " ";
      };
    };
    
    cpu = {
      interval = 5;
      format = ''{usage}% ${big ""}'';
      format-alt = ''${big " "}'';
      tooltip = false;
      
      states = {
        notIdle = 20;
        doinHeavyStuff = 50;
        compiling = 80;
      };
    };
    
    memory = {
      interval = 5;
      format = ''{used:0.1f}G/{total:0.1f}G ${big ""}'';
      format-alt = ''${big " "}'';
      tooltip = false;
      
      states = {
        someTabsOpened = 20;
        VMOpened = 50;
        chromeTabsOpened = 80;
      };
    };
    
    backlight = {
      interval = 5;
      format = ''{percent}% ${big "{icon}"}'';
      format-alt = ''${big " {icon}"}'';
      format-icons = [ "󰃞" "󰃟" "󰃠" ];
      tooltip = false;
      on-scroll-up = "exec ${pkgs.brightnessctl}/bin/brightnessctl set +1%";
      on-scroll-down = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 1%-";
    };
    
    disk = {
      interval = 30;
      format = ''${big " "}'';
      format-alt = ''{used}/{total} ${big ""}'';
      path = "/";
      tooltip = false;
      
      states = {
        cleanDownloads = 20;
        cleanNixStore = 50;
        removeISOsAndVMsLOL = 80;
      };
    };
    
    battery = {
      interval = 60;
      bat = "BAT0";
      format = ''{capacity}% ${big "{icon}"}'';
      format-alt = ''${big " {icon}"}'';
      format-icons = [ "󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
      tooltip = false;
      
      states = {
        runAndGetTheCharger = 20;
        prepareToRun = 40;
        tisGoinLow = 60;
      };
    };
    
    network = {
      interval = 5;
      format-wifi = ''${big " 󰖩"}'';
      format-ethernet = ''${big " 󰈀"}'';
      format-disconnected = ''${big ""}'';
      format-alt = ''{essid}: {ipaddr} | {bandwidthUpBits} ${big ""} {bandwidthDownBits} ${big ""}'';
      tooltip = false;
    };
    
    pulseaudio = {
      format = ''{volume}% ${big "{icon}"}'';
      format-muted = ''{volume}% ${big "󰝟 {icon}"}'';
      format-source-muted = ''{volume}% ${big " {icon}"}'';
      format-alt = ''${big " {icon}"}'';
      tooltip = false;
      on-click-right = "exec ${pkgs.pulseaudio}/bin/pactl set-sink-mute @DEFAULT_SINK@ toggle";
      on-click-middle = "exec ${pkgs.pavucontrol}/bin/pavucontrol";
      
      format-icons = {
        headphone = "󰋋";
        headset = "󰋎";
        hands-free = "";
        speaker = "󰓃";
        hifi = "󰤽";
        hdmi = "󰡁";
        phone = "󰏲";
        portable = "󰏲";
        car = "";
        default = [ "" "" "" ];
      };
    };
    
    temperature = {
      interval = 5;
      format = ''{temperatureC}°C ${big "{icon}"}'';
      format-alt = ''${big " {icon}"}'';
      format-icons = [ "" "" "" "" "" ];
      tooltip = false;
      critical-threshold = 80;
    };
  }];
}
