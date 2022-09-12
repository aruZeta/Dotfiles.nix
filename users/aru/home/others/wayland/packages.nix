{ pkgs
, enabledStuff
, usefulExpresions
, ...
}:

with pkgs;
usefulExpresions.condAndValuesList [
  { cond = enabledStuff.others.wayland.windowManager.sway.enable;
    vals = [
      swayidle
      libnotify
      wl-clipboard
      brightnessctl
      pavucontrol
    ];
  }
]
