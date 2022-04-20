pkgs: config:

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
++ (import ./non-module/swaylock/packages.nix  pkgs)
++ (import ./non-module/termusic/packages.nix pkgs)
++ (import ./non-module/wezterm/packages.nix pkgs)
++ (import ./non-module/wofi/packages.nix pkgs)
# Others
++ (import ./others/xdg/packages.nix pkgs config)
