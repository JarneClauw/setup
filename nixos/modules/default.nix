inputs: {
  imports = [
    #### HARDWARE ####
    ./data.nix

    #### SETTINGS ####
    ./fonts.nix
    ./locale.nix
    ./network.nix
    ./nix.nix
    ./pipewire.nix
    ./touchpad.nix

    #### ENVIRONMENT ####
    ./gnome.nix

    #### APPLICATIONS ####
    ./development.nix
    ./docker.nix
    ./terminal.nix
  ];
}
