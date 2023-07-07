{ lib
, ...
}:

{
  sshKeys = [ "9F9BC86D61E29C3F97ACBF528223DB2B62D6741B" ];
  defaultCacheTtl    = 3600 * 8;
  maxCacheTtl        = 3600 * 8;
  defaultCacheTtlSsh = 3600 * 8;
  maxCacheTtlSsh     = 3600 * 8;
  pinentryFlavor = "emacs";
  extraConfig = lib.strings.fileContents ./insertions/extra-config;
}
