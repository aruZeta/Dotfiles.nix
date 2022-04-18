{ pkgs
, config
}:

with pkgs; {
  apply-system = writeShellScriptBin "apply-system" ''
    pushd ${config.xdg.userDirs.extraConfig.XDG_DOTFILES_DIR}
    sudo nixos-rebuild switch -I nixos-config=./system/configuration.nix
    popd
  '';

  apply-user = writeShellScriptBin "apply-user" ''
    pushd ${config.xdg.userDirs.extraConfig.XDG_DOTFILES_DIR}
    home-manager switch -f ./home/home.nix
    popd
  '';

  update-system = writeShellScriptBin "update-system" ''
    sudo nix-channel --update
  '';

  update-user = writeShellScriptBin "update-user" ''
    nix-channel --update
  '';
}
