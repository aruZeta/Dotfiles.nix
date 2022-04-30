{ lib
, ...
}:

{
  sshKeys = [ "2DFF735B955F966CA0A33CE3EBECBBFF6EA666FF" ];
  defaultCacheTtl    = 3600 * 8;
  maxCacheTtl        = 3600 * 8;
  defaultCacheTtlSsh = 3600 * 8;
  maxCacheTtlSsh     = 3600 * 8;
  pinentryFlavor = "emacs";
  extraConfig = lib.strings.fileContents ./insertions/extra-config;
}
