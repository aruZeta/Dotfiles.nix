args @
{ pkgs
, usefulExpresions
, ...
}:

let
  inherit (builtins)
    concatMap;
  inherit (usefulExpresions)
    searchInSearchDirsSubdirs;
in

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
  concatMap
    (file: import file args)
    (searchInSearchDirsSubdirs "packages.nix")
)
