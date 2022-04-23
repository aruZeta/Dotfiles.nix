{ lib
, ...
}:

let
  inherit (builtins)
    foldl'
    readDir
    attrNames
    filter
    baseNameOf
    listToAttrs
    elemAt
    split;
  inherit (lib)
    filterAttrs
    mapAttrs'
    nameValuePair;
in

rec {
  concatSets = list:
    foldl' (x: y: x // y) {} list;

  filterDirectories = set:
    filterAttrs (path: type: type == "directory") set;

  searchDirs = [./programs ./non-module ./others];

  dirContents = dirPath:
    mapAttrs'
      (name: type: nameValuePair "${toString dirPath}/${name}" type)
      (readDir dirPath);

  searchDirsContents = concatSets (map (dir: dirContents dir) searchDirs);

  pathSetToList = set: map (path: /. + path) (attrNames set);

  searchDirsSubdirs = pathSetToList (filterDirectories searchDirsContents);

  searchInSearchDirsSubdirs = name:
    filter
      (path: (baseNameOf path) == name)
      (pathSetToList (concatSets (map
        (dir: dirContents dir)
        searchDirsSubdirs)));

  nameValueSet = dir: value:
    { ${dir} = value; };
}
