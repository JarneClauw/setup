{ lib, config, pkgs, ... }: {
  options = {
    moduleNix.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable the Nix module.";
    };
  };

  config = lib.mkIf config.moduleNix.enable {
    #### OPTIMISE STORE ####
    nix.settings.auto-optimise-store = true;

    #### GARBAGE COLLECTION ####
    nix.gc = {
      automatic = true;
      dates = "weekly";
      persistent = true;
      # Delete old profiles after a month
      options = "--delete-older-than 31d";
    };

    #### EXPERIMENTAL FEATURES ####
    nix = {
      package = pkgs.nixFlakes;
      extraOptions = "experimental-features = nix-command flakes";
    };
  };
}
