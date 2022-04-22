args @
{ usefulExpresions
, ...
}:

[] ++ (
  builtins.concatMap
    (val: builtins.attrValues val)
    (builtins.map
      (file: import file args)
      (usefulExpresions.searchInSearchDirsSubdirs "scripts.nix"))
)
