{ pkgs, ... }:

{
  # Applications that require NixOS-level integration rather than a user package.
  programs.firefox.enable = true;
  programs.winbox = {
    enable = true;
    openFirewall = true;
  };
  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  # Container and VM applications, including their required system integration.
  virtualisation.podman = {
    enable = true;
    dockerCompat = false;
  };
  programs.virt-manager.enable = true;
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
    };
  };
  fonts.packages = [
    (pkgs.cascadia-code)
  ];
  fonts.fontconfig.enable = true;
}
