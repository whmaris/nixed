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

  # OLLAMA
  services.ollama = {
    enable = true;
    package = pkgs.ollama-vulkan;
    environmentVariables = {
      HIP_VISIBLE_DEVICES = "-1";      # tắt ROCm
      GGML_VK_VISIBLE_DEVICES = "0";   # dùng GPU Vulkan đầu tiên
      OLLAMA_IGPU_ENABLE = "1";   # cho phép dùng GPU tích hợp
      OLLAMA_CONTEXT_LENGTH = "16384";
    };
  };

  #Nix-ld
  programs.nix-ld = {
    enable = true;

    libraries = with pkgs; [
      stdenv.cc.cc
      zlib
      openssl
      curl
    ];
  };
}
