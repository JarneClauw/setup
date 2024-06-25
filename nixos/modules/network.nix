##
## NETWORK
##

{ lib, config, host, ... }: {
  options = {
    moduleNetwork.enable = lib.mkEnableOption "enables the network module";
  };

  config = lib.mkIf config.moduleNetwork.enable {
    networking = {
      hostName = host;
      networkmanager.enable = true;
    };
  };
}

