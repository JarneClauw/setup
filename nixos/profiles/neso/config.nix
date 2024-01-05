###
### Neso
###

inputs: {
  imports = [
    ### MODULES ###
    ../../modules/nix.nix
    ../../modules/keyboard.nix
    ../../modules/locale.nix
    ../../modules/network.nix
    ../../modules/sound.nix
    ../../modules/gnome.nix
    ../../modules/bluetooth.nix
    ../../modules/fonts.nix
    ../../modules/printer.nix
    ../../modules/touchpad.nix
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

  ### SOPS-NIX ###
  sops.defaultSopsFile = ../../secrets/neso/default.yaml;
  sops.age.sshKeyPaths = ["/etc/ssh/ssh_host_ed25519_key"];

  ### STATE VERSION ###
  system.stateVersion = "23.05";
}
