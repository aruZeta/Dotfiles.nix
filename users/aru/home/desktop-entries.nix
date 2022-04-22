args @
{ usefulExpresions
, ...
}:

with usefulExpresions;
{} // (
  concatSets(
    builtins.map
      (file: import file args)
      (searchInSearchDirsSubdirs "desktop-entries.nix"))
)
