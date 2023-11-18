###
### All hosts
###

inputs: {
  ### BASE MODULES ###
  imports = [
    ../modules/nix.nix
    ../modules/keyboard.nix
    ../modules/locale.nix
    ../modules/network.nix
    ../modules/sound.nix
  ];

  ### BOOTLOADER ###
  boot.loader = {
    timeout = 3;		# Wait 3s before auto selection
    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;	# Find other OS's
      configurationLimit = 5;	# Limit 5 NixOS configurations
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };

  ### STATE VERSION ###
  system.stateVersion = "${inputs.stateVersion}";
}
