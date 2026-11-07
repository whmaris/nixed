{ pkgs, ... }:

{
  home.packages = with pkgs; [
    crystal-dock
    onlyoffice-desktopeditors
    dropbox
    vscode
    rustdesk-flutter
    brave
    google-chrome
    vlc
    inkscape
    gimp
    unar
    podman-compose
    ente-auth
    nodejs
    pnpm
    filen-desktop
    neovim
  ];

}
