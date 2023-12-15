###
### Fonts
###

inputs: {
  fonts.packages = with inputs.pkgs; [
    (nerdfonts.override { fonts = [ "Hack" "FiraCode" ]; })
  ];
}
