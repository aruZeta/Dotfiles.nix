{ pkgs
, ...
}:

{
  extraOptions = ''
    experimental-features = nix-command
  '';

  package = pkgs.nixUnstable;
}
