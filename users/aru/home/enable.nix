{
  programs = {
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
    plantuml = {
      enable = true;

      overlay = {
        enable = true;
        version = "1.2021.16";
        repo = "mirror://sourceforge/project/plantuml";
        sha256 = "sha256-0yN/29VKWiqp2Hi9aIN6GMlfMJPxrewsCQyyPVy6RAM=";
      };
    };

    python = {
      enable = true;

      overlay = {
        apsw-fix.enable = true;
      };
    };

    swappy.enable = true;
    swaylock.enable = true;

    termusic = {
      enable = true;

      overlay = {
        enable = true;
        version = "0.6.11";
        sha256 = "sha256-MdFLPlfN+GF1yUkBFH9y22okgUyxnC+/HfcvD7HXDzc=";
        cargoOutputHash = "sha256-L6tbpzUu5hN5Vy5fflT81K6bt+sI/6ru7IAOI63gDvM=";
      };
    };

    wezterm.enable = true;
    wofi.enable = true;
  };
}
