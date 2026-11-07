{ pkgs, ... }:

{
  #X11
  services.xserver.enable = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  #displayManager
  services.displayManager.sddm.enable = true;
  #KDE
  services.desktopManager.plasma6.enable = true;
  # Niri
  programs.niri.enable = true;
  environment.etc."niri/config.kdl".source = ./niri/config.kdl;
}
