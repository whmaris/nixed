{ pkgs, ... }:

{
  home.packages = with pkgs; [
    crystal-dock
    onlyoffice-desktopeditors
    dropbox
    vscode
    rustdesk-flutter
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
  ];

}
