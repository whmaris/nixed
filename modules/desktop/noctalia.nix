{ ... }:

{
  # Start Noctalia only in the Niri session; Plasma keeps its own panel.
  programs.noctalia = {
    enable = true;
    recommendedServices.enable = true;
    systemd.enable = true;
    systemd.target = "niri.service";
  };
}
