##
## RICING PACKAGES
##

{ lib, config, pkgs, ... }: {
  options = {
    packagesRicing.enable = lib.mkEnableOption "enables the ricing packages module";
  };

  config = lib.mkIf config.packagesRicing.enable {
    environment.systemPackages = with pkgs; [
      neofetch
      cbonsai
      cmatrix
      pipes
    ];
  };
}

