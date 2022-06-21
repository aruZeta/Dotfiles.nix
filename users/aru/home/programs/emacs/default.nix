{ pkgs
, ...
}:

{
  package = pkgs.emacsPgtkNativeComp;

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
    doom-modeline
    elcord
    emmet-mode
    evil
    evil-collection
    flycheck
    flycheck-nim
    general
    gruvbox-theme
    htmlize
    ivy
    ivy-rich
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
    org-superstar
    pinentry
    plantuml-mode
    projectile
    rainbow-delimiters
    slime
    slime-company
    svg-tag-mode
    treemacs
    treemacs-all-the-icons
    visual-fill-column
    vterm
    web-mode
    which-key
    yaml-mode
    yasnippet
  ]);
}
