##
## SOUND
##

{ lib, config, ... }: {
  options = {
    moduleSound.enable = lib.mkEnableOption "enables the sound module";
  };

  config = lib.mkIf config.moduleSound.enable {
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
	alsa.enable = true;
	alsa.support32Bit = true;
	pulse.enable = true;
	jack.enable = true;
    };
  };
}

