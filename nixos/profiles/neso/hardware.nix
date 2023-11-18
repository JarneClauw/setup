###
### Neso hardware
###

inputs: {
  imports = [
    (inputs.modulesPath + "/installer/scan/not-detected.nix")
  ];

  ### KERNEL ###
  boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "vmd" "nvme" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  ### FILE SYSTEM ###
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

  ### DATA PARTITION ###
  fileSystems."/media/data" = {
    label = "data";
    fsType = "ext4";
    options = [ "nofail" ]; 	# System startup won't crash if it fails to mount 
  };

  systemd.tmpfiles.rules = [
    "Z /media/data - jarne users"		# Give the user access
    "L+ /home/jarne/data - - - - /media/data"	# Add a symlink to ~/data
  ];

  ### OTHER ###
  networking.useDHCP = inputs.lib.mkDefault true; # When using systemd-networkd, specify per-interface
  nixpkgs.hostPlatform = inputs.lib.mkDefault inputs.system;
  powerManagement.cpuFreqGovernor = inputs.lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = inputs.lib.mkDefault inputs.config.hardware.enableRedistributableFirmware;
}
