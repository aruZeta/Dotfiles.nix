{ pkgs
, ...
}:

{
  # package = pkgs.emacs-pgtk;

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
    general
    gruvbox-theme
    ivy
    ivy-rich
    lsp-ivy
    lsp-mode
    lsp-treemacs
    lsp-ui
    magit
    nasm-mode
    nix-mode
    org-superstar
    org-tree-slide
    org-tree-slide-pauses
    projectile
    rainbow-delimiters
    ripgrep
    svg-tag-mode
    tide
    treemacs
    treemacs-all-the-icons
    visual-fill-column
    vterm
    which-key
    yasnippet
  ]);
}
