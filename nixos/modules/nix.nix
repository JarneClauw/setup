###
### Nix
###

inputs: {
  ### OPTIMISE STORE ###
  nix.settings.auto-optimise-store = true;

  ### GARBAGE COLLECTION ###
  nix.gc = {
    automatic = true;
    dates = "monthly";
    options = "--delete-older-than 31d";
  };

  ### EXPERIMENTAL FEATURES ###
  nix = {
    package = inputs.pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
  };
}
