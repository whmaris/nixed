{ ... }:

{
  programs.noctalia = {
    enable = true;        # cài package
    systemd.enable = true; # chạy Noctalia như service người dùng
    settings = ./noctalia/settings.toml;
  };
  wayland.systemd.target = "niri.service";
}
