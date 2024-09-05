{ lib, config, ... }: {
  options = {
    moduleTouchpad.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable the touchpad module.";
    };
  };

  config = lib.mkIf config.moduleTouchpad.enable {
    services.libinput = {
      enable = true;
      touchpad = {
        tapping = true;
	scrollMethod = "twofinger";
	naturalScrolling = true;
	disableWhileTyping = true;
      };
    };
  };
}
