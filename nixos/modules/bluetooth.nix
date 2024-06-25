##
## BLUETOOTH
##

{ lib, config, ... }: {
  options = {
    moduleBluetooth.enable = lib.mkEnableOption "enables the bluetooth module";
  };

  config = lib.mkIf config.moduleBluetooth.enable {
    hardware.bluetooth.enable = true;
  };
}

