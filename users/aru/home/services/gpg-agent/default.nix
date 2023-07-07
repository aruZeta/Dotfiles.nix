{ lib
, ...
}:

{
  sshKeys = [
    "4284CFA5CE7E5F985E6F7B5E242E2C7B35EF94E9"
    "9F9BC86D61E29C3F97ACBF528223DB2B62D6741B"
  ];
  defaultCacheTtl    = 3600 * 8;
  maxCacheTtl        = 3600 * 8;
  defaultCacheTtlSsh = 3600 * 8;
  maxCacheTtlSsh     = 3600 * 8;
  pinentryFlavor = "emacs";
  extraConfig = lib.strings.fileContents ./insertions/extra-config;
}
