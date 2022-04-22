args @
{ usefulExpresions
, ...
}:

with usefulExpresions;
{} // (
  concatSets(
    builtins.map
      (file: import file args)
      (searchInSearchDirsSubdirs "xdg-symlinks.nix"))
)
