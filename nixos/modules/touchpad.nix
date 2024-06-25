##
## TOUCHPAD
##

{ lib, config, ... }: {
  options = {
    moduleTouchpad.enable = lib.mkEnableOption "enables the touchpad module";
  };

  config = lib.mkIf config.moduleTouchpad.enable {
    services.libinput = {
      enable = true;
      touchpad = {
        tapping = true;
	scrollMethod = "twofinger";
	naturalScrolling = true;
      };
    };
  };
}

