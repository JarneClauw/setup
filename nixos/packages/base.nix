##
## BASE PACKAGES
##

{ lib, config, pkgs, ... }: {
  options = {
    packagesBase.enable = lib.mkEnableOption "enables the base packages module";
  };

  config = lib.mkIf config.packagesBase.enable {
    environment.systemPackages = with pkgs; [
      #### NIXOS CONFIGURATION ####
      sops
      age
      ssh-to-age
      #### FILE MANAGEMENT ####
      gnome.nautilus
      gnome.file-roller
      #### NOTES ####
      obsidian
      xournalpp
      #### MUSIC ####
      spotify
      #### OTHER ####
      firefox
      discord
      vscode
      betterbird
      libreoffice
      # virt-manager
    ];

    # Virt-manager
    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;
  };
}

