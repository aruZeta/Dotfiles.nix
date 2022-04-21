{ enabledStuff
, ...
}:

if enabledStuff.non-module.wezterm.enable
then {
  "wezterm/wezterm.lua".source = ./symlinked/wezterm.lua;
}
else {}
