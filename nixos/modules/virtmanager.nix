{ lib, config, pkgs, ... }: {
  options = {
    moduleVirtmanager.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable the virt-manager module.";
    };

    moduleVirtmanager.users = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [];
      description = "The users that want to use virt-manager.";
    };
  };

  config = lib.mkIf config.moduleVirtmanager.enable {
    virtualisation.libvirtd = {
      enable = true;
      qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
    };
    users.groups.libvirtd.members = config.moduleVirtmanager.users;

    programs.virt-manager.enable = true;
  };
}
