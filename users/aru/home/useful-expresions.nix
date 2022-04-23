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
    concatMap
    split;
  inherit (lib)
    filterAttrs
    mapAttrs'
    nameValuePair
    toUpper;
in

rec {
  concatSets = list:
    foldl' (x: y: x // y) {} list;

  concatMapSets = f: list:
    concatSets(map f list);

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

  dirToImportSet = path: args:
    concatSets (map
      (dir: nameValueSet (baseNameOf dir) (import dir args))
      (pathSetToList (filterDirectories (dirContents path))));

  searchImportList = file: args:
    concatMap (path: import path args) (searchInSearchDirsSubdirs file);

  searchImportSet = file: args:
    concatMapSets (path: import path args) (searchInSearchDirsSubdirs file);

  genSet = values: fname: fvalue:
    listToAttrs (map
      (val: nameValuePair
        (fname (toString val))
        (fvalue (toString val)))
      values);

  genSet' = values: fnames-fvalues:
    concatSets (map
      (val: (genSet values (elemAt val 0) (elemAt val 1)))
      fnames-fvalues);

  capitalize = string:
    let splits = split "(^.)" string;
    in (toUpper (elemAt (elemAt splits 1) 0))
       + (elemAt splits 2);
}
