{ lib, config, ... }: {
  options = {
    moduleLocale.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable the locale module.";
    };
  };

  config = lib.mkIf config.moduleLocale.enable {
    time.timeZone = "Europe/Brussels";
    i18n.defaultLocale = "en_US.UTF-8";
  };
}
