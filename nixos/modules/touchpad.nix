###
### Touchpad
###

{
  services.xserver.libinput = {
    enable = true;
    touchpad = {
      tapping = true;
      scrollMethod = "twofinger";
      naturalScrolling = true;
    };
  };
}
