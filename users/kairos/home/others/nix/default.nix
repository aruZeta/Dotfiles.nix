{ pkgs
, ...
}:

{
  package = pkgs.nixFlakes;

  extraOptions = ''
    experimental-features = nix-command flakes
  '';

  settings = {
    substituters = [
      "https://cache.nixos.org/"
      "https://my-dotfiles.cachix.org/"
    ];

    trusted-substituters = [
      "https://cache.nixos.org/"
      "https://my-dotfiles.cachix.org/"
    ];

    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "my-dotfiles.cachix.org-1:YDHITP4F3601yKboAauidYKxrxhyPverDppC2vwAqHM="
    ];
  };
}
