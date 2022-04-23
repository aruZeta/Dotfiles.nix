args @
{ usefulExpresions
, ...
}:

builtins.attrValues (usefulExpresions.searchImportSet "scripts.nix" args)
