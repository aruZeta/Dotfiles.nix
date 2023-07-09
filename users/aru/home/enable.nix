{
  programs = {
    alacritty.enable = false;

    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    eclipse.enable = false;
    emacs.enable = true;
    eww.enable = false;
    firefox.enable = true;

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    git.enable = true;
    gpg.enable = true;
    java.enable = true;
    mbsync.enable = false;
    mu.enable = false;
    neovim.enable = false;
    obs-studio.enable = true;
    ssh.enable = true;

    starship = {
      enable = true;
      enableZshIntegration = true;
    };

    texlive.enable = true;
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

    mako.enable = true;
    mbsync.enable = false;

    gpg-agent = {
      enable = true;
      enableSshSupport = true;
      enableZshIntegration = true;
    };
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
    android-studio.enable = true;
    calibre.enable = true;
    common-lisp.enable = true;
    koreader.enable = false;
    python.enable = true;
    swappy.enable = true;
    swaylock.enable = true;
    termusic.enable = false;
    webcord.enable = false;
    wezterm.enable = true;
    wofi.enable = true;
    zohomail.enable = false;
  };

  # Enabled unfree packages
  unfreePackages = [
    "steam"
    "steam-original"
    "discord"
    "android-studio"
    "android-studio-stable"
  ];
}
