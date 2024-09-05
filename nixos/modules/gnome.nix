{ lib, config, ... }: {
  options = {
    moduleGnome.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable the GNOME module.";
    };
  };

  config = lib.mkIf config.moduleGnome.enable {
    services.xserver = {
      enable = true;
      desktopManager.gnome.enable = true;
    };
    services.gnome.core-utilities.enable = false;
  };
}
