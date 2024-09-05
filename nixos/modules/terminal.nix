{ lib, config, pkgs, ... }: {
  options = {
    moduleTerminal.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable the terminal module.";
    };
  };

  config = lib.mkIf config.moduleTerminal.enable {
    environment.systemPackages = with pkgs; [
      #### TERMINAL ####
      alacritty
      zsh
      starship
      tmux
      #### CONFIGURATION ####
      sops
      age
      ssh-to-age
      #### DEVELOPMENT ####
      neovim
      git
      #### TOOLS ####
      lsd
      tldr
      fzf
      hyperfine
      stow
      fd
      tokei
      btop
      duf
      ncdu
      procs
    ];
  };
}
