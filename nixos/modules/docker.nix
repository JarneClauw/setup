{ lib, config, pkgs, ... }: {
  options = {
    moduleDocker.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable the docker module.";
    };
  };

  config = lib.mkIf config.moduleDocker.enable {
    virtualisation.docker = {
      enable = true;
      rootless = {
        enable = true;
	setSocketVariable = true;
      };
    };

    environment.systemPackages = with pkgs; [ docker-compose ];
  };
}
