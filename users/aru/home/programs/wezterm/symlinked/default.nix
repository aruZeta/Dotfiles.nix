{ config
}:

{
  xdg-symlinks =
    if (import ../default.nix {}).programs.wezterm.enable
    then {
      "wezterm/wezterm.lua".source = ./wezterm.lua;
    }
    else {};
}
