{ pkgs
, config
}:

{}
# Non-module
 // (import ./non-module/termusic/desktop-entries.nix {inherit config pkgs;})
