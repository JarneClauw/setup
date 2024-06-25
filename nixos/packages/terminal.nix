##
## TERMINAL PACKAGES
##

{ lib, config, pkgs, ... }: {
  options = {
    packagesTerminal.enable = lib.mkEnableOption "enables the terminal packages module";
  };

  config = lib.mkIf config.packagesTerminal.enable {
    environment.systemPackages = with pkgs; [
      #### TERMINAL ####
      alacritty
      zsh
      starship
      tmux
      #### TOOLS ####
      neovim
      git
      lsd
      tldr
      fzf
      hyperfine
      stow
      fd
      tokei
      #### MONITORING TOOLS ####
      btop
      duf
      ncdu
      procs
      #### DOCKER ####
      docker-compose
    ];

    #### DIRENV ####
    programs.direnv = {
      enable = true;
      silent = true;
      loadInNixShell = true;
      nix-direnv.enable = true;
    };

    #### DOCKER ####
    virtualisation.docker.enable = true;
  };
}

