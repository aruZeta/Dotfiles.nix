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
++ (import ./programs/termusic/packages.nix {inherit pkgs config;})
++ (import ./programs/wezterm/packages.nix {inherit pkgs config;})
++ (import ./programs/wofi/packages.nix {inherit pkgs config;})
++ (import ./others/xdg/packages.nix {inherit pkgs config;})
