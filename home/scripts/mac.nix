pkgs: config:

with pkgs; [
  ( writeShellScriptBin "apply" ''
      pushd ${config.home.homeDirectory}/Dotfiles.nix
      darwin-rebuild switch --flake .#$1
      popd
    ''
  )
]
