{ pkgs
, ...
}:

{
  package = pkgs.emacsPgtk;

  overrides = self: super: {
    org = self.elpaPackages.org;
  };

  extraPackages = (epkgs: with epkgs; [
    all-the-icons
    all-the-icons-dired
    all-the-icons-ivy-rich
    company
    company-lua
    counsel
    dap-mode
    direnv
    dockerfile-mode
    doom-modeline
    evil
    evil-collection
    flycheck
    flycheck-nim
    general
    gruvbox-theme
    ivy
    ivy-rich
    lsp-ivy
    lsp-mode
    lsp-treemacs
    lsp-ui
    magit

    nix-mode
    org-superstar
    org-tree-slide
    org-tree-slide-pauses
    pinentry
    projectile
    rainbow-delimiters
    ripgrep
    tide
    treemacs
    treemacs-all-the-icons
    visual-fill-column
    vterm
    which-key
    yaml-mode
    yasnippet
  ]);
}
