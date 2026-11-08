{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/settings/system.nix
    ../../modules/apps/system-programs.nix
    ../../modules/desktop/de.nix
  ];

  home-manager.users.neo.imports = [
    ./home.nix
    ../../modules/desktop/autostart.nix
    #../../modules/desktop/noctalia.nix
    #../../modules/desktop/umbriel.nix
    ../../modules/apps/home-flatpak.nix
    ../../modules/apps/home-pkgs.nix
    ../../modules/apps/home-programs.nix
  ];
}
