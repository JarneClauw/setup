##
## FONTS
##

{ lib, config, pkgs, ... }: {
  options = {
    moduleFonts.enable = lib.mkEnableOption "enables the fonts module";
  };

  config = lib.mkIf config.moduleFonts.enable {
    fonts.packages = with pkgs; [
      (nerdfonts.override { fonts = ["FiraCode"]; })
    ];
  };
}

