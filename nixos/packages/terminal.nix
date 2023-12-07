###
### Packages needed when using the terminal
###

inputs: {
  environment.systemPackages = with inputs.pkgs.unstable; [
    alacritty
    git
    zsh
    direnv
    neovim
    htop
    tldr
    fzf
    lsd
    hyperfine
    stow
  ];
}
