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

  /* Takes a list of sets and returns the concatenation of all the sets

     Example: concatSets [ {a = 1;} {b = 2;} ]
     => {a = 1; b = 2;}
  */
  concatSets = list:
    foldl' (x: y: x // y) {} list;

  /* Equivalent to concatSets(map f list).
  */
  concatMapSets = f: list:
    concatSets(map f list);

  /* Takes a set given from readDir and returns a set where all it's elements
     are of the type "directory".
  */
  filterDirectories = set:
    filterAttrs (path: type: type == "directory") set;

  /* Same as readDir but the paths are absolute paths
  */
  dirContents = dirPath:
    mapAttrs'
      (name: type: nameValuePair "${toString dirPath}/${name}" type)
      (readDir dirPath);

  /* Just a variable which holds the dirs with configs
  */
  searchDirs = [./programs ./non-module ./others];

  /* List of the contents of searchDirs
  */
  searchDirsContents = concatSets (map (dir: dirContents dir) searchDirs);

  /* Takes a set given from dirContents and turns it in a list of paths
  */
  pathSetToList = set: map (path: /. + path) (attrNames set);

  /* List of all dirs inside searchDirs
  */
  searchDirsSubdirs = pathSetToList (filterDirectories searchDirsContents);

  /* Search a file/folder by it's name in every dir in searchDirsSubdirs
     Note: This is not a recursive search
  */
  searchInSearchDirsSubdirs = name:
    filter
      (path: (baseNameOf path) == name)
      (pathSetToList (concatSets (map
        (dir: dirContents dir)
        searchDirsSubdirs)));

  /* Returns a set { name = value; }
  */
  nameValueSet = name: value:
    { ${name} = value; };

  /* Returns a set where name is the dir name and the value is the import of
     it's default.nix file.
  */
  dirToImportSet = path: args:
    concatSets (map
      (dir: nameValueSet (baseNameOf dir) (import dir args))
      (pathSetToList (filterDirectories (dirContents path))));

  /* Returns a list with the imports of all files returned by
     searchInSearchDirsSubdirs
     Note: all the files must return a list
  */
  searchImportList = file: args:
    concatMap (path: import path args) (searchInSearchDirsSubdirs file);

  /* Returns a set with the imports of all files returned by
     searchInSearchDirsSubdirs
     Note: all the files must return a set
  */
  searchImportSet = file: args:
    concatMapSets (path: import path args) (searchInSearchDirsSubdirs file);

  /* Returns a set made of appliyng a value to fname as name and fvalue as value

     Example: genSet [1 2 3] (v: "n${v}") (v: v)
     => { n1 = "1"; n2 = "2"; n3 = "3"; }
  */
  genSet = values: fname: fvalue:
    listToAttrs (map
      (val: nameValuePair
        (fname (toString val))
        (fvalue (toString val)))
      values);

  /* Same as genSet' but applies each value to a list of fnames and fvalues

     Example: genSet' [ 1 2 3 ] [[(v: "n${v}") (v: v)] [(v: "m${v}") (v: v)]]
     => { m1 = "1"; m2 = "2"; m3 = "3"; n1 = "1"; n2 = "2"; n3 = "3"; }
  */
  genSet' = values: fnames-fvalues:
    concatSets (map
      (val: (genSet values (elemAt val 0) (elemAt val 1)))
      fnames-fvalues);

  /* Returns a string with the first char being capitalized
  */
  capitalize = string:
    let splits = split "(^.)" string;
    in (toUpper (elemAt (elemAt splits 1) 0))
       + (elemAt splits 2);
}
