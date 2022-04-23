args @
{ pkgs
, usefulExpresions
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
] ++ (usefulExpresions.searchImportList "packages.nix" args)
