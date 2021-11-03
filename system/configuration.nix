{ modulesPath
, pkgs
, ...
}:

{
  # I think this was auto-generated?
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot = {
    initrd.availableKernelModules = [ "xhci_pci" "ahci" "ehci_pci" "usbhid" "usb_storage" "sd_mod" "sr_mod" ];
    kernelModules = [ "kvm-amd" ];
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

  # My btrfs subvols
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/506fcdab-eb1d-4fa6-9ab1-3511fc7c3e22";
      fsType = "btrfs";
      options = [ "subvol=nixos" "compress-force=lzo" ];
    };

    "/home" = {
      device = "/dev/disk/by-uuid/506fcdab-eb1d-4fa6-9ab1-3511fc7c3e22";
      fsType = "btrfs";
      options = [ "subvol=nixos/home" "compress-force=lzo" ];
    };

    "/nix/store" = {
      device = "/dev/disk/by-uuid/506fcdab-eb1d-4fa6-9ab1-3511fc7c3e22";
      fsType = "btrfs";
      options = [ "subvol=nixos/nix/store" "compress-force=lzo" ];
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/9152-BAE9";
      fsType = "vfat";
    };
  };

  # Swap partition, should have made a sway file instead
  swapDevices = [
    { device = "/dev/disk/by-uuid/dafb92fe-c36f-4895-a8cd-b18e7325a2da"; }
  ];

  # I think it's me!
  nix.allowedUsers = [ "aru" ];

  # Poor imagination, maybe I should rename it to "emacs-church.org", pun intended
  networking.hostName = "aru-hackZ";

  time.timeZone = "Europe/Madrid";

  # This one is deprecated
  networking.useDHCP = false;
  # Use this
  networking.interfaces.enp2s0.useDHCP = true;
  networking.interfaces.wlp3s0.useDHCP = true;
  networking.networkmanager.enable = true;

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
        hashedPassword = "$6$kW4T4vV/$JjK0WjLDpsD.9jVqFsdAfy267.W8iEia6wEsrbD/DWNk2spUr2UxTRRsBdLgk2DfSRoaAdUC/PhW7o2UAjyed0";
        extraGroups = [ "wheel" "networkmanager" "vboxusers" ];
	shell = pkgs.zsh;
      };
    };
  };

  # Current unstable version
  system.stateVersion = "21.11";

}
