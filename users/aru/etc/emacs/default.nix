{ pkgs
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
      company-lua

      counsel

      emmet-mode
      lsp-mode
      lua-mode
      nix-mode
      web-mode

      lsp-ivy
      # lsp-java
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
      doom-modeline

      htmlize

      # To make sure that mu is in load-path, since it seems there are people
      # reporting it doesn't appear in their's, no problem in mine tho
      pkgs.mu
      mu4e-alert

      # Idk why this is here, tho its interesting
      # yasnippet

      all-the-icons
      all-the-icons-dired
      all-the-icons-ivy-rich
      treemacs-all-the-icons

      svg-tag-mode
    ]);
  };

  xdg.configFile = {
    "emacs/init.el".source = ./init.el;
    "emacs/startup.org".source = ./startup.org;
    "emacs/config.org".source = ./config.org;
  };
}
