{ pkgs, ... }:

{
  # Applications that require NixOS-level integration rather than a user package.
  programs.winbox = {
    enable = true;
    openFirewall = true;
  };

  # Container
  virtualisation.podman = {
    enable = true;
    dockerCompat = false;
  };

  #VM applications.
  programs.virt-manager.enable = true;
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
    };
  };

  # Font
  fonts.packages = [
    (pkgs.cascadia-code)
  ];
  fonts.fontconfig.enable = true;
}
