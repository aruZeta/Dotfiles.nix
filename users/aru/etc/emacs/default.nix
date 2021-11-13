{ pkgs
, lib
, ...
}:

{
  programs.emacs = {
    enable = true;

    # Emacs pure gtk package
    package = pkgs.emacsPgtk;

    # Emacs config
    # TODO: Better way to set this with infile imports from within init.el
    extraConfig = builtins.concatStringsSep "\n" [
      (lib.strings.fileContents ./init.el)
    ];

    # No use-package
    extraPackages = (epkgs: with epkgs; [
      company
      counsel
      emmet-mode
      evil
      flycheck
      gruvbox-theme
      htmlize
      ivy
      ivy-rich
      lsp-ivy
      lsp-java
      lsp-mode
      lsp-treemacs
      lsp-ui
      magit
      nix-mode
      pinentry
      projectile
      treemacs
      web-mode
      which-key
      yasnippet
    ]);
  };
}
