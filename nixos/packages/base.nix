###
### Base packages
###

inputs: {
  environment.systemPackages = with inputs.pkgs.unstable; [
    # NixOS config
    sops
    age
    ssh-to-age
    # Other
    vscode
    firefox
    brave
    discord
    spotify
    spicetify-cli
    virt-manager
    betterbird
    libreoffice
    obsidian
    xournalpp
  ];

  # Virt-manager
  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;
}
