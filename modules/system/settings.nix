{ pkgs, ... }:

{
  # Boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Network and firewall policy. Add publicly reachable service ports here.
  networking = {
    hostName = "ws";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [
        80 # HTTP
      ];
    };
  };

  # Device services
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Locale and Vietnamese input method
  time.timeZone = "Asia/Ho_Chi_Minh";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5.addons = [ pkgs.qt6Packages.fcitx5-unikey ];
    };
  };

  # Printing, audio, and desktop-service policy
  services = {
    flatpak.enable = true;
    printing.enable = true;
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
  security.rtkit.enable = true;

  # Nix behavior and generation retention
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  # Local login account and privileges
  users.users.neo = {
    isNormalUser = true;
    description = "Neo";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    shell = pkgs.fish;
    packages = [ pkgs.kdePackages.kate ];
  };
  programs.fish.enable = true;


  # Compatibility baseline: change only after reviewing NixOS migration notes.
  system.stateVersion = "26.05";
}
