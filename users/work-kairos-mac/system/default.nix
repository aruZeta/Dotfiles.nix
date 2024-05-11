{ config
, pkgs
, lib
, ...
} @ inputs:

let
  name = inputs.user.name;
  home = inputs.user.home;
  enabledStuff = (import ../enable.nix);
  nixpkgsConfig = {
    allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) enabledStuff.unfreePackages;
  };
in

{
  nixpkgs = {
    config = nixpkgsConfig;
    overlays = import ./overlays.nix inputs;
  };

  services.nix-daemon.enable = true;
  
  nix = {
    package = pkgs.nixFlakes;

    settings = rec {
      trusted-users = [ "@admin" "aru" ];
      allowed-users = trusted-users;

      trusted-substituters = [
        "https://my-dotfiles.cachix.org/"
      ];

      substituters = trusted-substituters;

      trusted-public-keys = [
        "my-dotfiles.cachix.org-1:YDHITP4F3601yKboAauidYKxrxhyPverDppC2vwAqHM="
      ];
    };

    extraOptions = ''
      keep-outputs = true
      keep-derivations = true
      experimental-features = nix-command flakes
    '';
  };

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      iosevka
      (nerdfonts.override { fonts = [ "Iosevka" ]; })
      emacs-all-the-icons-fonts
    ];
  };

  users.users."${name}" = {
    inherit name;
    inherit home;
    isHidden = false;
    shell = pkgs.zsh;
  };

  programs = {
    zsh.enable = true;
  };
}
