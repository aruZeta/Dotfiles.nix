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
++ (import ./non-module/termusic/packages.nix {inherit pkgs;})
++ (import ./non-module/wezterm/packages.nix {inherit pkgs;})
++ (import ./non-module/wofi/packages.nix {inherit pkgs;})
# Others
++ (import ./others/xdg/packages.nix {inherit pkgs config;})
