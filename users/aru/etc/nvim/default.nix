{ pkgs
, lib
, ...
}:

{
  programs.neovim = {
    enable = true;

    # Neovim nightly, for the ones who want to compile it each morning
    # TODO: pin the $!@$% package, tired of recompiling
    package = pkgs.neovim-nightly;

    # Extra config, using lua
    extraConfig = builtins.concatStringsSep "\n" [
      (lib.strings.fileContents ./init.vim)
    ];
  };
}
