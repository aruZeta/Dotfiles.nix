{ pkgs
, lib
, ...
}:

{
  system.stateVersion = "23.05";

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
    # This one is deprecated
    useDHCP = false;

    networkmanager.enable = true;

    # Interfaces are activated in /system/hardware/<your-laptop-or-pc-model>.nix
  };

  nix = {
    settings = rec {
      trusted-users = [ "root" "aru" ];

      allowed-users = trusted-users;

      trusted-substituters = [
        "https://my-dotfiles.cachix.org/"
      ];

      substituters = trusted-substituters;

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
    "steam"
    "steam-original"
    "steam-runtime"
    "steam-run"
  ];

  time.timeZone = "Europe/Madrid";
  i18n.defaultLocale = "en_US.UTF-8";

  programs = {
    adb.enable = true;
    nix-ld.enable = true;

    # So home-manager doesn't complain (when adding gtk)
    dconf.enable = true;

    wireshark = {
      enable = true;
      package = pkgs.wireshark;
    };

    steam = {
      enable = true;
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

    udev.packages = with pkgs; [
      qmk-udev-rules
    ];

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };

    openssh = {
      enable = true;
      passwordAuthentication = true;
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
          "libvirtd"
          "adbusers"
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
    # virtualbox.host.enable = true;
    # libvirtd.enable = true;

    docker = {
      enable = true;
      storageDriver = "btrfs";
    };
  };

  environment.systemPackages = with pkgs; [
    # virt-manager
  ];

  xdg = {
    portal = {
      enable = true;
      wlr.enable = true;
    };
  };
}
