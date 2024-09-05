{ lib, config, pkgs, ... }: {
  options = {
    moduleFonts.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable the fonts module.";
    };
  };

  config = lib.mkIf config.moduleFonts.enable {
    fonts.packages = with pkgs; [
      (nerdfonts.override { fonts = [ "FiraCode" ]; })
    ];
  };
}
