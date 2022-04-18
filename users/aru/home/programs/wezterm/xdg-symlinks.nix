{ config
}:

if (import ./default.nix {}).programs.wezterm.enable
then {
  "wezterm/wezterm.lua".source = ./symlinked/wezterm.lua;
}
else {}
