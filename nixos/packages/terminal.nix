###
### Packages needed when using the terminal
###

inputs: {
  environment.systemPackages = with inputs.pkgs.unstable; [
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
  ];

  # Direnv setup
  programs.direnv = {
    enable = true;
    package = inputs.pkgs.unstable.direnv;
    silent = true;
    loadInNixShell = true;
    nix-direnv = {
      enable = true;
      package = inputs.pkgs.unstable.nix-direnv;
    };
  };
}
