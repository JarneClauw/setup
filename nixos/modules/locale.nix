##
## TIMEZONE & LOCALE
##

{ lib, config, ... }: {
  options = {
    moduleLocale.enable = lib.mkEnableOption "enables the locale module";
  };

  config = lib.mkIf config.moduleLocale.enable {
    time.timeZone = "Europe/Brussels";
    i18n.defaultLocale = "nl_BE.UTF-8";
  };
}

