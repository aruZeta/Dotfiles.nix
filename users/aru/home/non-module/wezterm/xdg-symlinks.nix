if (import ../../enable.nix).non-module.wezterm.enable
then {
  "wezterm/wezterm.lua".source = ./symlinked/wezterm.lua;
}
else {}
