{  ... }:

{
  # X11
  services.xserver.enable = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Display Manager
  services.displayManager.sddm.enable = true;

  # KDE Plasma 6
  services.desktopManager.plasma6.enable = true;

  # Niri
  # programs.niri.enable = true;
  # environment.etc."niri/config.kdl".source = ./niri/config.kdl;

  # Umbriel
  programs.umbriel.enable = true;

  # Umbriel Cachix
  nix.settings = {
    extra-substituters = [
      "https://umbriel.cachix.org"
    ];
    extra-trusted-public-keys = [
      "umbriel.cachix.org-1:JfNq/2yg2S6D6z4Z2dVSZrZlDPQTKtexB6GAVLD98nw="
    ];
  };
}
