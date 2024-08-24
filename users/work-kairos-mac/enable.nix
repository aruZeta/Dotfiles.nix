{
  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    emacs.enable = true;

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    git.enable = true;
    gpg.enable = true;
    obs-studio.enable = false;
    ssh.enable = true;

    starship = {
      enable = true;
      enableZshIntegration = true;
    };

    texlive.enable = false;

    zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      autocd = true;
    };
  };

  services = {
    emacs = {
      enable = false;
      client.enable = true;
      socketActivation.enable = false;
    };
  };

  others = {
    xdg.enable = true;
  };

  # Local variables not applied directly to home-manager, used to setup
  # overlays, packages, symlinks, scripts, etc.
  non-module = {
    direnv.flakez.enable = true;
  };

  unfreePackages = [
    "spotify"
    "obsidian"
    "idea-ultimate"
    "webstorm"
    "goland"
  ];
}
