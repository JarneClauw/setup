###
### Packages needed when using the terminal
###

inputs: {
  environment.systemPackages = with inputs.pkgs; [
    alacritty
    zsh
    starship
    tmux
    git
    neovim
    htop
    tldr
    fzf
    lsd
    hyperfine
    stow
    lf
    feh
  ];

  # Direnv setup
  programs.direnv = {
    enable = true;
    silent = true;
    loadInNixShell = true;
    nix-direnv = {
      enable = true;
    };
  };
}
