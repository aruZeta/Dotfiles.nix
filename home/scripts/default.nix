pkgs: config:

with pkgs; [
  ( writeShellScriptBin "apply" ''
      pushd ${config.xdg.userDirs.extraConfig.XDG_DOTFILES_DIR}
      sudo nixos-rebuild switch --flake ~/Dotfiles.nix/#$1
      popd
    ''
  )
]
