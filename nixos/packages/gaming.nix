##
## GAMING PACKAGES
##

{ lib, config, pkgs, ... }: {
  options = {
    packagesGaming.enable = lib.mkEnableOption "enables the gaming packages module";
  };

  config = lib.mkIf config.packagesGaming.enable {
    environment.systemPackages = with pkgs; [
      #### RUNNERS ####
      mgba		# GameBoy Advanced emulator
      desmume		# Nintendo DS emulator
      # steam		# Enabled through config
      lutris		# Linux
      bottles		# Windows
      #### PERFORMANCE ####
      protonup		# ProtonGE, performance patches, 'protonup' to install the latest
      mangohud		# Performance overlay, 'mangohud %command%' in launch options
      #### OTHER ####
      ckan		# KSP modding
    ];

    hardware.opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };

    programs.steam.enable = true;
    programs.steam.gamescopeSession.enable = true; # Resolution and upscaling, 'gamescope %command%' in launch options
    programs.gamemode.enable = true; # Optmizes game performance, 'gamemoderun %command%' in lauch options

    environment.sessionVariables = {
      # Installation path for ProtonGE
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/jarne/.steam/root/compatibilitytools.d";
    };
  };
}

