###
### Base packages
###

inputs: {
  environment.systemPackages = with inputs.pkgs.unstable; [
    # NixOS config
    sops
    age
    # Other
    vscode
    firefox
    brave
    discord
    spotify
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
