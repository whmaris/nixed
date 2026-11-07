{ pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings.user = {
      name = "Neo";
      email = "wheelhousemaris@gmail.com";
    };
  };
}
