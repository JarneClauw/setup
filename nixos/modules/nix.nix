##
## NIX
##

{ lib, config, pkgs, ... }: {
  options = {
    moduleNix.enable = lib.mkEnableOption "enables the nix module";
  };

  config = lib.mkIf config.moduleNix.enable {
    #### OPTIMISE STORE ####
    nix.settings.auto-optimise-store = true;

    #### GARBAGE COLLECTION ####
    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 31d"; # Deletes old profiles after a month
    };

    #### EXPERIMENTAL FEATURES ####
    nix = {
      package = pkgs.nixFlakes;
      extraOptions = "experimental-features = nix-command flakes";
    };
  };
}

