###
### Fonts
###

inputs: {
  fonts.fonts = with inputs.pkgs; [
    (nerdfonts.override { fonts = [ "Hack" "FiraCode" ]; })
  ];
}
