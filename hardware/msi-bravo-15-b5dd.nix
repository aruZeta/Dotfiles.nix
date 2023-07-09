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
    initrd.kernelModules = [ "amdgpu" ];
    initrd.supportedFilesystems = [ "btrfs" ];
    supportedFilesystems = [ "btrfs" ];
    kernelModules = [ "kvm-amd" ];

    # doesn't seem to solve anything, will leave it there anyway
    kernelParams = [
      "video=eDP-1:1920x1080@144"
      "video=HDMI-A-1:1920x1080@60"
    ];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/8effeb50-01d2-4e51-9802-b47d369dedd5";
      fsType = "btrfs";
      options = [ "subvol=@nixos" "x-systemd.automount" "noatime" ];
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/17DC-2F14";
      fsType = "vfat";
    };

    "/nix/store" = {
      device = "/dev/disk/by-uuid/8effeb50-01d2-4e51-9802-b47d369dedd5";
      fsType = "btrfs";
      options = [ "subvol=@store" "x-systemd.requires-mounts-for=/home" "noatime" ];
    };

    "/GitRepos" = {
      device = "/dev/disk/by-uuid/8effeb50-01d2-4e51-9802-b47d369dedd5";
      fsType = "btrfs";
      options = [ "subvol=@GitRepos" "noatime" ];
    };

    "/home" = {
      device = "/dev/disk/by-uuid/8effeb50-01d2-4e51-9802-b47d369dedd5";
      fsType = "btrfs";
      options = [ "subvol=@nixos/home" "x-systemd.requires-mounts-for=/" "noatime" ];
    };

    "/swap" = {
      device = "/dev/disk/by-uuid/8effeb50-01d2-4e51-9802-b47d369dedd5";
      fsType = "btrfs";
      options = [ "subvol=@swap" ];
    };
  };

  swapDevices = [ { device = "/swap/swapfile"; } ];

  hardware = {
    cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

    opengl = {
      extraPackages = with pkgs; [
        rocm-opencl-icd
        rocm-opencl-runtime
        amdvlk
      ];

      extraPackages32 = with pkgs; [
        driversi686Linux.amdvlk
      ];

      driSupport = true;
      driSupport32Bit = true;
    };
  };

  networking = {
    interfaces.enp4s0.useDHCP = true;
    interfaces.wlp5s0.useDHCP = true;
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
}
