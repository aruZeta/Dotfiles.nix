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
    java.enable = true;
    obs-studio.enable = true;
    ssh.enable = true;

    starship = {
      enable = true;
      enableZshIntegration = true;
    };

    waybar.enable = true;

    zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
      enableSyntaxHighlighting = true;
      autocd = true;
    };
  };

  services = {
    emacs = {
      enable = false;
      client.enable = true;
      socketActivation.enable = false;
    };

    gpg-agent = {
      enable = true;
      enableSshSupport = true;
      enableZshIntegration = true;
    };

    mako.enable = true;
  };

  others = {
    gtk.enable = true;
    qt.enable = true;

    wayland.windowManager.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
    };

    xdg = {
      enable = true;
      userDirs.enable = true;
      mimeApps.enable = true;
    };
  };

  # Local variables not applied directly to home-manager, used to setup
  # overlays, packages, symlinks, scripts, etc.
  non-module = {
    emacs.overlay = {
      enable = true;
      repo = "https://github.com/nix-community/emacs-overlay";
      commit = "ea9ceddec99ab3c66017ab3104fb86863e26154a";
    };

    python = {
      enable = true;
    };

    swappy.enable = true;
    swaylock.enable = true;

    wezterm.enable = true;
    wofi.enable = true;
  };

  # Enabled unfree packages
  unfreePackages = [
    "google-chrome"
    "slack"
  ];
}
