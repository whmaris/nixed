{ ... }:

{
  services.flatpak = {
    enable = true;

    remotes = [
      {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }
    ];

    packages = [
      "eu.betterbird.Betterbird"
      "com.usebottles.bottles"
      "com.tencent.WeChat"
      "com.rtosta.zapzap"
    ];

    update.auto = {
      enable = true;
      onCalendar = "weekly";
    };
  };
}
