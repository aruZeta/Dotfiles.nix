args @
{ usefulExpresions
, ...
}:

let
  inherit (builtins)
    map
    baseNameOf;
  inherit (usefulExpresions)
    concatSets
    nameValueSet
    pathSetToList
    filterDirectories
    dirContents;
in

concatSets
  (map
    (dir: nameValueSet
      (baseNameOf dir)
      (import dir args))
    (pathSetToList (filterDirectories (dirContents ./.))))
