args @
{ usefulExpresions
, ...
}:

let
  inherit (builtins)
    map;
  inherit (usefulExpresions)
    concatSets
    searchInSearchDirsSubdirs;
in

concatSets(map
  (file: import file args)
  (searchInSearchDirsSubdirs "desktop-entries.nix"))
