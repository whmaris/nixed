{ ... }:

{
  xdg.configFile."autostart/crystal-dock.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=Crystal Dock
    Exec=crystal-dock
    OnlyShowIn=KDE;
    X-GNOME-Autostart-enabled=true
  '';

  xdg.configFile."autostart/dropbox.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=Dropbox
    Exec=dropbox start -i
    X-GNOME-Autostart-enabled=true
  '';
  xdg.configFile."niri/config.kdl".source = ./niri/config.kdl;

}
