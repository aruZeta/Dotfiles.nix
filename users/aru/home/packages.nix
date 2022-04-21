{ config
, pkgs
, lib
, enabledStuff
, ...
}:

with pkgs; [
  # Utilities
  sass
  unzip

  # Ebook reader & editor
  sigil
  # calibre

  # QMK
  qmk

  # Music
  yt-dlp
]
# Non modules
++ (import ./non-module/swaylock/packages.nix {inherit pkgs enabledStuff;})
++ (import ./non-module/termusic/packages.nix {inherit pkgs enabledStuff;})
++ (import ./non-module/wezterm/packages.nix {inherit pkgs enabledStuff;})
++ (import ./non-module/wofi/packages.nix {inherit pkgs enabledStuff;})
# Others
++ (import ./others/xdg/packages.nix {inherit pkgs enabledStuff;})
