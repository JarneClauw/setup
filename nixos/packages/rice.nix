###
### Packages needed when ricing
###

inputs: {
  environment.systemPackages = with inputs.pkgs.unstable; [
    neofetch
    cbonsai
    cmatrix
    pipes
  ];
}
