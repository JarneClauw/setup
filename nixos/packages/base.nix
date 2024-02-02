###
### Base packages
###

inputs: {
  environment.systemPackages = with inputs.pkgs; [
    # NixOS config
    sops
    age
    ssh-to-age
    # File management
    gnome.nautilus
    gnome.file-roller
    # Notes
    obsidian
    xournalpp
    # Music
    spotify
    spicetify-cli
    # Other
    firefox
    brave
    discord
    vscode
    virt-manager
    betterbird
    libreoffice
  ];

  # Virt-manager
  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;
}
