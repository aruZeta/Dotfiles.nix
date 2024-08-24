{ lib
, ...
}:

{
  extraConfig =
    (lib.strings.fileContents ./insertions/extra-config);
}
