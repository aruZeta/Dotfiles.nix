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
] ++ (
  builtins.concatMap
    (file: import file args)
    (usefulExpresions.searchInSearchDirsSubdirs "packages.nix")
)
