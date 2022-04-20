{ pkgs
, config
, lib
, ...
}:

{
  home = {
    username = "aru";
    homeDirectory = "/home/${config.home.username}";
  };

  home.packages =
    (import ./packages.nix pkgs config)
    ++ (import ./scripts.nix pkgs config lib);

  nixpkgs.overlays = (import ./overlays.nix);

  programs = (import ./programs pkgs config lib);

  # Enable stuff
  imports =
    let enabledStuff = (import ./enable.nix);
    in [
      { programs = enabledStuff.programs; }
      enabledStuff.others
    ];
}
// (import ./others config pkgs)
