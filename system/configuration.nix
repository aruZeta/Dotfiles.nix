{ config
, pkgs
, ...
}:

{
  imports =
    [
      ./hardware/msi-bravo-15-b5dd.nix
    ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  # So sway works
  hardware.opengl = {
    enable = true;
    driSupport = true;
  };

  # So home-manager doesn't complain (when adding gtk)
  programs.dconf.enable = true;

  # So swaylock works
  security.pam.services.swaylock.text =
    ''
    auth include login
    '';

  # I think it's me!
  nix.settings.allowed-users = [ "aru" ];

  networking = {
    # Poor imagination, maybe I should rename it to "emacs-church.org", pun intended
    hostName = "aru-hackZ";

    # This one is deprecated
    useDHCP = false;

    networkmanager.enable = true;

    # Interfaces are activated in hardware/<your-laptop-or-pc-model>.nix
  };

  time.timeZone = "Europe/Madrid";

  i18n.defaultLocale = "en_US.UTF-8";

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # VMs are explosive, most of the times
  virtualisation.virtualbox.host.enable = true;

  users = {
    mutableUsers = false;

    users = {
      aru = {
        isNormalUser = true;
        createHome = true;
        uid = 6262;
        # Pretty long right
        hashedPassword =
          "$6$kW4T4vV/$JjK0WjLDpsD.9jVqFsdAfy267.W8iEia6wEsrbD/DWNk2spUr2UxTRRsBdLgk2DfSRoaAdUC/PhW7o2UAjyed0" ;
        shell = pkgs.zsh;

        extraGroups = [
          "wheel"
          "networkmanager"
          "vboxusers"
          "GitReposEditors"
        ];
      };
    };

    groups = {
      GitReposEditors = {
        gid = 2001;
      };
    };
  };

  system = {
    # Current unstable version
    stateVersion = "22.05";

    activationScripts = {
      setGitReposPermissions =
        ''
        chown root:2001 /GitRepos
        chmod 2775 /GitRepos
        '';
    };
  };
}
