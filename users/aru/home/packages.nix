{ pkgs
, config
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
++ (import ./non-module/termusic/packages.nix {inherit pkgs config;})
++ (import ./non-module/wezterm/packages.nix {inherit pkgs config;})
++ (import ./non-module/wofi/packages.nix {inherit pkgs config;})
# Programs
# Others
++ (import ./others/xdg/packages.nix {inherit pkgs config;})
