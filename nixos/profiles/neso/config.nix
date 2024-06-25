##
## NESO CONFIGURATION
##

{
  #### MODULES ####
  moduleBluetooth.enable = true;
  modulePrinter.enable = true;
  moduleTouchpad.enable = true;

  #### BOOTLOADER ####
  boot.loader = {
    timeout = 1;
    systemd-boot = {
      enable = true;
      configurationLimit = 10;
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };

  #### USERS ####
  users.users."jarne" = {
    isNormalUser = true;
    description = "Jarne Clauw";
    extraGroups = [
      "wheel"          # Superuser
      "networkmanager" # Network settings
      "video" "audio"  # Audio and video devices
      "lp" "scanner"   # Printers and scanners
      "dialout"        # Serial ports
      "libvirtd"       # Virtual machines
      "docker"         # Docker
    ];
  };

  #### ENVIRONMENT ####
  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
  };
  services.gnome.core-utilities.enable = false;

  #### SOPS-NIX ####
  sops.defaultSopsFile = ../../secrets/neso/default.yaml;
  sops.age.sshKeyPaths = ["/etc/ssh/ssh_host/ed25519_key"];
}

