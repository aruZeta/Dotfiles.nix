{ enabledStuff
, ...
}:

{}
# Non-module
// (import ./non-module/wezterm/xdg-symlinks.nix {inherit enabledStuff;})
// (import ./non-module/wofi/xdg-symlinks.nix {inherit enabledStuff;})
# Others
// (import ./others/gtk/xdg-symlinks.nix {inherit enabledStuff;})
