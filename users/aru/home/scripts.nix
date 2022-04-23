args @
{ usefulExpresions
, ...
}:

let
  inherit (builtins)
    concatMap
    attrValues
    map;
  inherit (usefulExpresions)
    searchInSearchDirsSubdirs;
in

[] ++ (
  concatMap
    (val: attrValues val)
    (map
      (file: import file args)
      (searchInSearchDirsSubdirs "scripts.nix"))
)
