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
    doom-modeline
    elcord
    elixir-mode
    emmet-mode
    evil
    evil-collection
    exercism
    flycheck
    flycheck-nim
    general
    gruvbox-theme
    htmlize
    ivy
    ivy-rich
    json-mode
    lispy
    lsp-ivy
    lsp-java
    lsp-mode
    lsp-treemacs
    lsp-ui
    lua-mode
    magit

    # To make sure that mu is in load-path, since it seems there are people
    # reporting it doesn't appear in their's, no problem in mine tho
    pkgs.mu

    mu4e-alert
    nasm-mode
    nim-mode
    nix-mode
    ob-nim
    org-superstar
    org-tree-slide
    org-tree-slide-pauses
    pinentry
    plantuml-mode
    projectile
    rainbow-delimiters
    ripgrep
    #slime
    #slime-company
    svg-tag-mode
    tide
    treemacs
    treemacs-all-the-icons
    typescript-mode
    visual-fill-column
    vterm
    web-mode
    which-key
    yaml-mode
    yasnippet
    zig-mode
  ]);
}
