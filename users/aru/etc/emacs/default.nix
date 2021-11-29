{ config
, pkgs
, lib
, ...
}:

{
  programs.emacs = {
    enable = true;

    # Emacs pure gtk package
    package = pkgs.emacsPgtk;

    # No use-package
    extraPackages = (epkgs: with epkgs; [
      company
      counsel
      emmet-mode
      evil
      evil-collection
      flycheck
      general
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
      org-superstar
      pinentry
      projectile
      treemacs
      visual-fill-column
      web-mode
      which-key
      yasnippet
    ]);
  };

  home.file = {
    "${config.xdg.configHome}/emacs/init.el".source = ./init.el;
    "${config.xdg.configHome}/emacs/startup.org".source = ./startup.org;
  };
}
