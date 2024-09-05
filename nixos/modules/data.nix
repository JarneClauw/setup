{ lib, config, ... }: {
  options = {
    moduleData.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable the data partition module.";
    };

    moduleData.users = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [];
      description = "The users that have access to the data partition.";
    };
  };

  config = lib.mkIf config.moduleData.enable {
    # Create the data group and add the users to it
    users.groups.data.members = config.moduleData.users;

    # Change the permissions to allow the data group to access the files
    # Add symlinks from ~/data to /media/data for every user
    systemd.tmpfiles.rules = let
      permissionRules = [ "Z /media/data 0770 root data" ];
      symlinkRuleFunction = user: "L+ /home/${user}/data - - - - /media/data";
      symlinkRules = builtins.map symlinkRuleFunction config.moduleData.users;
    in permissionRules ++ symlinkRules;
  };
}
