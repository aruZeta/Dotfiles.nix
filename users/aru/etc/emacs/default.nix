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

    # Override org package to use elpa instead of builtin
    overrides = self: super: {
      org = self.elpaPackages.org;
    };

    # No use-package
    extraPackages = (epkgs: with epkgs; [
      company

      counsel

      emmet-mode
      lsp-mode
      nix-mode
      web-mode

      lsp-ivy
      lsp-java
      lsp-treemacs
      lsp-ui

      evil
      evil-collection

      ivy
      ivy-rich

      flycheck
      treemacs
      projectile

      general
      which-key

      magit
      pinentry

      gruvbox-theme
      org-superstar
      visual-fill-column

      htmlize

      # Idk why this is here, tho its interesting
      # yasnippet
    ]);
  };

  home.file = {
    "${config.xdg.configHome}/emacs/init.el".source = ./init.el;
    "${config.xdg.configHome}/emacs/startup.org".source = ./startup.org;
    "${config.xdg.configHome}/emacs/config.org".source = ./config.org;
  };
}
