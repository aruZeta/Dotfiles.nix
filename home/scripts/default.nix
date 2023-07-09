pkgs: config:

with pkgs; {
  apply = writeShellScriptBin "apply" ''
    pushd ${config.xdg.userDirs.extraConfig.XDG_DOTFILES_DIR}
    sudo nixos-rebuild switch --flake ~/Dotfiles.nix/#$1
    popd
  '';
}
