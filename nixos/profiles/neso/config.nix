###
### Neso
###

inputs: let
  modules = l: map (module: ./. + "/../../modules/${module}.nix") l;
in {
  imports = (modules [
    ### BASE MODULES ###
    "nix" "keyboard" "locale" "network" "sound"
    ### EXTRA MODULES ###
    "gnome" "bluetooth" "fonts" "printer" "touchpad"
  ]) ++ [
    ### PACKAGES ###
    ../../packages/base.nix
    ../../packages/terminal.nix
    ../../packages/rice.nix
    ### EXTRA CONFIGS ###
    ./backup.nix
    ./antivirus.nix
  ];

  ### BOOTLOADER ###
  boot.loader = {
    timeout = 1;		# Wait 1s before auto selection
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;	# Find other OS's
      configurationLimit = 5;	# Keep 5 configurations
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };

  ### USERS ###
  users.users."jarne" = {
    isNormalUser = true;
    description = "Jarne Clauw";
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "lp" "scanner" "dialout" "libvirtd" ];
  };
  
  ### ENVIRONMENT ###
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
  };

  ### STATE VERSION ###
  system.stateVersion = "23.11";
}
