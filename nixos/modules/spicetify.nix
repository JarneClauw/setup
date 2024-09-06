{ lib, config, pkgs, spicetify, ... }: {
  imports = [ spicetify.nixosModules.default ];

  options = {
    moduleSpicetify.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable the spicetify module.";
    };
  };

  config = let
    pkgs-spicetify = spicetify.legacyPackages.${pkgs.system};
  in lib.mkIf config.moduleSpicetify.enable {
    programs.spicetify = {
      enable = true;
      theme = pkgs-spicetify.themes.catppuccin;
      colorScheme = "mocha";
      enabledExtensions = with pkgs-spicetify.extensions; [
        fullAppDisplay
        shuffle
	betterGenres
	adblock
	beautifulLyrics
      ];
      enabledCustomApps = with pkgs-spicetify.apps; [
        newReleases
	betterLibrary
      ];
    };
  };
}
