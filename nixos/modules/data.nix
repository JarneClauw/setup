{ lib, config, ... }: {
  options = {
    moduleData.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable the data partition module.";
    };

  };

  config = lib.mkIf config.moduleData.enable {
    # Change the permissions to allow access to the files
    # Add a symlink from ~/data to /media/data
    systemd.tmpfiles.rules = [
      "Z /media/data - jarne users"
      "L+ /home/jarne/data - - - - /media/data/data"
    ];
  };
}
