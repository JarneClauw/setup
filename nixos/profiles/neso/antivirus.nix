###
### Neso antivirus
###

inputs: {
  environment.systemPackages = with inputs.pkgs; [ clamav ];

  services.clamav = {
    daemon.enable = true;	# Enable clamd
    updater.enable = true;	# Update the database
  };

  ### SERVICE ###
  systemd.services.clamscan = {
    script = "${inputs.pkgs.clamav}/bin/clamscan --infected --recursive --log=/home/jarne/clamscan/logs/$(date +%Y%m%d) --move=/home/jarne/clamscan/infected /home/jarne";
  };

  # Make sure the directories are created
  systemd.tmpfiles.rules = [
    "d /home/jarne/clamscan - jarne users"
    "d /home/jarne/clamscan/logs - jarne users"
    "d /home/jarne/clamscan/infected - jarne users"
  ];

  ### AUTOMATE SERVICE ###
  systemd.timers.clamscan = {
    wantedBy = ["timers.target"];
    timerConfig = {
      OnCalendar = "daily";
      Persistent = true; # Also run when service missed timer that day
      Unit = "clamscan.service";
    };
  };
}
