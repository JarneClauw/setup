{ lib, config, pkgs, ... }: {
  options = {
    moduleGaming.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable the gaming module.";
    };
  };

  config = lib.mkIf config.moduleGaming.enable {
    #### PROTONDB ####
    # https://www.protondb.com
    # Check if a game is linux compatible

    environment.systemPackages = with pkgs; [
      #### RUNNERS ####
      mgba    # GameBoy Advance
      desmume # Nintendo DS
      # steam
      lutris  # Linux
      bottles # Windows
      #### PERFORMANCE ####
      # Performance patches,
      # 'protonup -d "~/.steam/root/compatibilitytools.d"' to update ProtonGE
      # Then select the latest ProtonGE in the compatibility menu
      protonup
      # Performance overlay, launch options -> 'mangohud %command%'
      mangohud
      #### OTHER ####
      ckan # KSP modding
    ];
    programs.steam.enable = true;
    
    #### PERFORMANCE ####
    # Fixes upscaling and resolution problems, launch options -> 'gamescope %command%'
    programs.steam.gamescopeSession.enable = true;
    # Temporary optimizations, launch options -> 'gamemoderun %command%'
    programs.gamemode.enable = true; # Temporary optimizations
  };
}
