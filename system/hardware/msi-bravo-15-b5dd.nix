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
    initrd.availableKernelModules = [ "nvme" "xhci_pci" "usb_storage" "sd_mod" ];
    initrd.kernelModules = [ ];
    kernelModules = [ "kvm-amd" ];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/8effeb50-01d2-4e51-9802-b47d369dedd5";
      fsType = "btrfs";
      options = [ "subvol=@nixos" ];
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/17DC-2F14";
      fsType = "vfat";
    };

    "/GitRepos" = {
      device = "/dev/disk/by-uuid/8effeb50-01d2-4e51-9802-b47d369dedd5";
      fsType = "btrfs";
      options = [ "subvol=@GitRepos" ];
    };

    "/home" = {
      device = "/dev/disk/by-uuid/8effeb50-01d2-4e51-9802-b47d369dedd5";
      fsType = "btrfs";
      options = [ "subvol=@nixos/home" ];
    };

    "/swap" = {
      device = "/dev/disk/by-uuid/8effeb50-01d2-4e51-9802-b47d369dedd5";
      fsType = "btrfs";
      options = [ "subvol=@swap" ];
    };
  };

  swapDevices = [ { device = "/swap/swapfile"; } ];

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  networking = {
    interfaces.enp4s0.useDHCP = true;
    # interfaces.wlp5s0.useDHCP = true;
  };
}
