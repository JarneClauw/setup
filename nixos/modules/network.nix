{ lib, config, ... }: {
  options = {
    moduleNetwork.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable the network module.";
    };

    moduleNetwork.name = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = "The network name of the device.";
    };
  };

  config = lib.mkIf (config.moduleNetwork.enable && config.moduleNetwork.name != null) {
    networking = {
      hostName = config.moduleNetwork.name;
      networkmanager.enable = true;
    };
  };
}
