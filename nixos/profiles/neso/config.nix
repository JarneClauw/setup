###
### Neso
###

inputs: {
  imports = [
    ../../modules/bluetooth.nix
    ../../modules/fonts.nix
    ../../modules/printer.nix
    ../../modules/touchpad.nix
  ];

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
    desktopManager.gnome.enable = true;
  };

  ### GNOME ###
  # Removing all default applications
}
