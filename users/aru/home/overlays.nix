args @
{ usefulExpresions
, ...
}:

[] ++ (
  builtins.concatMap
    (file: import file args)
    (usefulExpresions.searchInSearchDirsSubdirs "overlays.nix")
)
