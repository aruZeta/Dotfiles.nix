{ config
}:

{
  xdg-symlinks =
    if (import ../default.nix {}).programs.wofi.enable
    then {
      "wofi/config".source = ./wofi.conf;
      "wofi/style.css".source = ./wofi.css;
    }
    else {};
}
