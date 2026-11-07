{ ... }:

{
  # NixOS modules enabled for this machine. Hardware details stay host-local;
  # reusable configuration lives in modules/.
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/settings.nix
    ../../modules/system/apps.nix
    ../../modules/desktop/de.nix
  ];

  # User-session configuration for neo. Keep user identity host-local; import
  # reusable desktop, shell, application, and development features below.
  home-manager.users.neo.imports = [
    ./home.nix
    ../../modules/desktop/autostart.nix
    ../../modules/desktop/noctalia.nix
    ../../modules/apps/flatpak.nix
    ../../modules/apps/packages.nix
    ../../modules/program/zed.nix
    ../../modules/program/wezterm.nix
    ../../modules/program/fish.nix
    ../../modules/program/git.nix

  ];
}
