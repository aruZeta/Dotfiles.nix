{ lib
, ...
}:

rec {
  concatSets = list:
    builtins.foldl' (x: y: x // y) {} list;

  filterDirectories = set:
    lib.filterAttrs (path: type: type == "directory") set;

  searchDirs = [./programs ./non-module ./others];

  dirContents = dirPath:
    lib.mapAttrs'
      (name: type: lib.nameValuePair "${toString dirPath}/${name}" type)
      (builtins.readDir dirPath);

  searchDirsContents = concatSets (map (dir: dirContents dir) searchDirs);

  pathSetToList = set: map (path: /. + path) (builtins.attrNames set);
  
  searchDirsSubdirs = pathSetToList (filterDirectories searchDirsContents);

  searchInSearchDirsSubdirs = name:
    builtins.filter
      (path: (builtins.baseNameOf path) == name)
      (pathSetToList (concatSets (map (dir: dirContents dir) searchDirsSubdirs)));

  nameValueSet = dir: value:
    { ${dir} = value; };
}
