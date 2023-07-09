{ config
, lib
, pkgs
, modulesPath
, ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    extraModulePackages = [ ];
    kernelModules = [ "kvm-amd" ];
    kernelPackages = pkgs.linuxPackages_latest;
    supportedFilesystems = [ "btrfs" ];

    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
      kernelModules = [ ];
      supportedFilesystems = [ "btrfs" ];
    };

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/50e3a18c-7a3a-4c06-bafb-4f613832f8d1";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/FB79-C910";
      fsType = "vfat";
    };

    "/GitRepos" = {
      device = "/dev/disk/by-uuid/eccd8a1b-40fb-42b1-a0ca-c463cb60ed01";
      fsType = "btrfs";
      options = [ "subvol=@GitRepos" "noatime" ];
    };
  };

  swapDevices = [ ];

  hardware = {
    cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };

  networking = {
    interfaces.eno1.useDHCP = true;
    interfaces.wlp1s0.useDHCP = true;
  };

  services = {
    # Tlp
    tlp = {
      enable = true;

      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      };
    };
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}

