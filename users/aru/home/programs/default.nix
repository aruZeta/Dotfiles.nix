args @
{ usefulExpresions
, ...
}:

with usefulExpresions;
concatSets
  (builtins.map
    (dir: nameValueSet
      (builtins.baseNameOf dir)
      (import dir args))
    (pathSetToList (filterDirectories (dirContents ./.))))
