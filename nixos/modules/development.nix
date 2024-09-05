{ lib, config, pkgs, ... }: {
  options = {
    moduleDevelopment.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable the development module.";
    };
  };

  config = lib.mkIf config.moduleDevelopment.enable {
    #### PACKAGES ####
    environment.systemPackages = with pkgs; [
      neovim
      vscode
      git
    ];

    programs.direnv = {
      enable = true;
      silent = true;
      nix-direnv.enable = true;
    };
  };
}
