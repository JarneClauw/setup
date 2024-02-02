###
### Neso backup
###

# Using restic with rclone. 'rclone config' to setup repositories used by restic
# Don't encrypt the rclone config, restic had problems decrypting it
# 'restic -r rclone:<name>:/backup snapshots' to show a list with snapshots
# 'restic -r rclone:<name>:/backup restore <id/latest> --target <path>' to restore

inputs: let
  initialize = true;                # Create the directory if it does not exist

  paths = ["/media/data"];
  exclude = [
    "/media/data/projects"
    "/media/data/lost+found"
    "/media/data/.Trash*"
  ];

  timerConfig = {
    OnCalendar = "daily";           # Run daily
    Persistent = true;              # Run backup if you were inactive on triggering
  };
  pruneOpts = ["--keep-daily 365"]; # Keep snapshots for 1 year
in {
  ### PACKAGES ###
  environment.systemPackages = with inputs.pkgs; [
    rclone
    restic
  ];

  ### SOPS ###
  # By default secrets are owned by root
  # The parent directory '/run/secrets.d' is owned by root and the keys group has read access
  sops.secrets.restic = {
    owner = inputs.config.systemd.services."restic-backups-onedrive".serviceConfig.User;
  };

  ### ONEDRIVE ###
  services.restic.backups.onedrive = {
    user = "jarne";
    repository = "rclone:onedrive:backups/neso";
    inherit initialize paths exclude timerConfig pruneOpts;
    passwordFile = inputs.config.sops.secrets.restic.path;
  };

  systemd.services."restic-backups-onedrive" = {
    after = [ "network-online.target" "sops-nix.service" ];
    serviceConfig.SupplementaryGroups = [ inputs.config.users.groups.keys.name ];
  };
}
