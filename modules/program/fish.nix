{ pkgs, ... }:

{
  #Bash
  programs.bash = {
    enable = true;
    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake ~/nixed#ws";
      ndg = "sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations";
      ngc = "sudo nix-collect-garbage";
    };
  };

  #Fish
  programs.fish = {
    enable = true;

    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake ~/nixed#ws";
      ndg = "sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations";
      ngc = "sudo nix-collect-garbage";
    };

    interactiveShellInit = ''
      set fish_greeting
    '';
  };
}
