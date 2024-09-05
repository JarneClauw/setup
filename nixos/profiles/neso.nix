{ modulesPath, pkgs, ... }: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ../modules
  ];

  #### BOOT & KERNEL ####
  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "thunderbolt"
    "vmd"
    "nvme"
    "usb_storage"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [];

  #### FILE SYSTEM ####
  fileSystems."/" = {
    label = "nixos";
    fsType = "ext4";
  };
  fileSystems."/boot" = {
    label = "ESP";
    fsType = "vfat";
  };
  swapDevices = [
    { label = "swap"; }
  ];

  #### DATA PARTITION ####
  fileSystems."/media/data" = {
    label = "data";
    fsType = "ext4";
    options = [ "nofail" ];
  };

  #### GENERAL HARDWARE ####
  hardware.cpu.intel.updateMicrocode = true;
  system.stateVersion = "24.05";

  #### BOOTLOADER ####
  boot.loader = {
    timeout = 1;
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
      configurationLimit = 10;
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };

  #### USERS ####
  users.users.jarne = {
    isNormalUser = true;
    description = "Jarne Clauw";
    extraGroups = [
      "wheel"          # Superuser
      "networkmanager" # Network settings
    ];
    packages = with pkgs; [
      nautilus
      file-roller
      obsidian
      xournalpp
      spotify
      firefox
      discord
      libreoffice
    ];
  };

  #### ENVIRONMENT ####
  moduleGnome.enable = true;
  services.xserver.displayManager.gdm.enable = true;

  #### GENERAL SETTINGS ####
}
