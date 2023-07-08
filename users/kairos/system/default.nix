{ pkgs
, lib
, ...
}:

{
  system.stateVersion = "23.05";

  hardware = {
    # So sway works
    opengl = {
      enable = true;
    };
  };

  networking = {
    hostName = "aruKairosWorkMachine"; # Define your hostname.

    # This one is deprecated
    useDHCP = false;

    networkmanager.enable = true;

    # Interfaces are activated in /system/hardware/<your-laptop-or-pc-model>.nix
  };

  nix = {
    settings = {
      allowed-users = [ "aru" ];

      substituters = [
        "https://my-dotfiles.cachix.org/"
      ];

      trusted-substituters = [
        "https://my-dotfiles.cachix.org/"
      ];

      trusted-public-keys = [
        "my-dotfiles.cachix.org-1:YDHITP4F3601yKboAauidYKxrxhyPverDppC2vwAqHM="
      ];
    };

    extraOptions = ''
      keep-outputs = true
      keep-derivations = true
    '';
  };

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
  ];

  time.timeZone = "Europe/Madrid";
  i18n.defaultLocale = "en_US.UTF-8";

  programs = {
    # So home-manager doesn't complain (when adding gtk)
    dconf.enable = true;
    nix-ld.enable = true;

    wireshark = {
      enable = true;
      package = pkgs.wireshark;
    };

    zsh.enable = true;
  };

  security = {
    # So swaylock works
    pam.services.swaylock.text =
      ''
      auth include login
      '';
  };

  services = {
    locate = {
      enable = true;
      locate = pkgs.mlocate;
      localuser = null;
      prunePaths = [
        "/tmp"
        "/var/tmp"
        "/var/cache"
        "/var/lock"
        "/var/run"
        "/var/spool"
        # "/nix/store" # So I can locate header files mostly
        "/nix/var/log/nix"
      ];
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
  };

  users = {
    mutableUsers = false;

    users = {
      aru = {
        isNormalUser = true;
        createHome = true;
        uid = 6262;
        shell = pkgs.zsh;

        # Pretty long right
        hashedPassword =
          "$y$j9T$kKXBpRQP24iiGb57FOtqU/$SZp5GmMLaWsW18C4L5QW2cVbX0LiWqzoKPWwZKcml3/";

        extraGroups = [
          "wheel"
          "networkmanager"
          "GitReposEditors"
          "video"
          "wireshark"
          "docker"
        ];
      };
    };

    groups = {
      GitReposEditors = {
        gid = 2001;
      };
    };
  };

  virtualisation = {
    docker = {
      enable = true;
    };
  };

  xdg = {
    portal = {
      enable = true;
      wlr.enable = true;
    };
  };
}
