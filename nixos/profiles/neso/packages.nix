###
### Neso packages
###

inputs: {
  environment.systemPackages = with inputs.pkgs.unstable; [
    ### BASE ###
    alacritty
    vscode
    firefox
    discord
    spotify
    virt-manager
    brave
    betterbird
    libreoffice
    obsidian
    xournalpp

    ### TERMINAL ###
    git
    zsh
    direnv
    neovim
    htop
    tldr
    fzf
    lsd
    hyperfine

    ### GAMING ###
    # mgba	# GameBoy Advanced emulator
    # desmume	# Nintendo DS emulator
    # steam	# Enabled with config
    # ckan	# KSP modding

    ### RICING ###
    neofetch
    cbonsai
    cmatrix
    pipes
  ];
  
  ### BASE CONFIG ###
  # VIRT-MANAGER #
  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;


  ### GAMES CONFIG ###
  # STEAM #
  # programs.steam.enable = true
  # hardware.opengl.driSupport32Bit = true; # Enables support for 32bit libs that steam uses
}
