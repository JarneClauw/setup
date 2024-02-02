###
### Packages needed when ricing
###

inputs: {
  environment.systemPackages = with inputs.pkgs; [
    neofetch
    cbonsai
    cmatrix
    pipes
  ];
}
