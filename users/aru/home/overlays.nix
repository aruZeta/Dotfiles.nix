args @
{ usefulExpresions
, ...
}:

let
  inherit (builtins)
    concatMap;
  inherit (usefulExpresions)
    searchInSearchDirsSubdirs;
in

concatMap
  (file: import file args)
  (searchInSearchDirsSubdirs "overlays.nix")
