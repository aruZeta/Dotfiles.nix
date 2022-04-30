{
  programs = {
    alacritty.enable = false;
    eclipse.enable = true;
    emacs.enable = true;
    eww.enable = true;
    mbsync.enable = true;
    mu.enable = true;
    firefox.enable = true;

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    git.enable = true;
    gpg.enable = true;
    java.enable = true;
    neovim.enable = true;
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
      enable = true;
      client.enable = true;
      socketActivation.enable = true;
    };

    mbsync.enable = false;

    gpg-agent = {
      enable = true;
      enableSshSupport = true;
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
    common-lisp.enable = true;

    emacs.overlay = {
      enable = true;
      repo = "https://github.com/nix-community/emacs-overlay";
      commit = "7368fbf298996bc024396c1cdb1e194f7a2cd3c6";
    };

    eww.overlay = {
      enable = true;
      version = "fb0e57a0149904e76fb33807a2804d4af82350de";
      sha256 = "sha256-oAbB9aW/nqg02peqGEfETOGgeXarI6ZcAZ6DzDXbOSE=";
      cargoOutputHash = "sha256-zN6qqCvFYCD3sUIqC9XZyyUVc/9zQ0UB/gRq96Gaf94=";
    };

    koreader = {
      enable = false;

      overlay = {
        enable = true;
        version = "2021.12";
        repo = "https://github.com/koreader/koreader";
        sha256 = "sha256-duOIbYavqmUUkH6RthTYu/SeM8zOeeLm7CIAQwhw6AY=";
      };
    };

    neovim.overlay = {
      enable = true;
      repo = "https://github.com/nix-community/neovim-nightly-overlay";
      commit = "7933df62bb350d2f4a258f9e110decc08baaf627";
    };

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

  # Enabled unfree packages
  unfreePackages = [
    "discord"
  ];
}
