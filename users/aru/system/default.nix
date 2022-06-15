{ pkgs
, lib
, ...
}:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  hardware = {
    # So sway works
    opengl = {
      enable = true;
    };
  };

  networking = {
    hostName = "aru-hackZ";

    # This one is deprecated
    useDHCP = false;

    networkmanager.enable = true;

    # Interfaces are activated in /system/hardware/<your-laptop-or-pc-model>.nix
  };

  nix = {
    settings.allowed-users = [ "aru" ];
  };

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-original"
    "steam-runtime"
  ];

  time.timeZone = "Europe/Madrid";
  i18n.defaultLocale = "en_US.UTF-8";

  programs = {
    # So home-manager doesn't complain (when adding gtk)
    dconf.enable = true;

    steam = {
      enable = true;
    };
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

    udev.packages = with pkgs; [
      qmk-udev-rules
    ];

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      media-session.enable = true;
      wireplumber.enable = false;
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
          "$6$kW4T4vV/$JjK0WjLDpsD.9jVqFsdAfy267.W8iEia6wEsrbD/DWNk2spUr2UxTRRsBdLgk2DfSRoaAdUC/PhW7o2UAjyed0" ;

        extraGroups = [
          "wheel"
          "networkmanager"
          "vboxusers"
          "GitReposEditors"
          "video"
          "mlocate"
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
    # virtualbox.host.enable = true;
  };

  xdg = {
    portal = {
      enable = true;
      wlr.enable = true;
    };
  };
}
