{ pkgs, ... }:

{
  # Boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Network and firewall policy.
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

  # Services
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
    upower.enable = true;
    power-profiles-daemon.enable = true;
  };
  security.rtkit.enable = true;
  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # Enable un-free apps
  nixpkgs.config.allowUnfree = true;

  # Local login account and privileges
  users.users.neo = {
    isNormalUser = true;
    description = "Neo";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    shell = pkgs.fish;
  };
  programs.fish.enable = true;

  #Enable Appimage
  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  # hardware for AI
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      # Thư viện tính toán ROCm cho Ollama và AI
      rocmPackages.clr
      rocmPackages.clr.icd
      rocmPackages.rocblas
      rocmPackages.rocm-runtime

      # Trình điều khiển đồ họa và mã hóa chuẩn (Khuyên dùng RADV tích hợp sẵn trong Mesa)
      mesa
      libva
      libvdpau-va-gl
    ];
  };

  # Bật OpenCL để Ollama nhận diện iGPU AMD
  hardware.amdgpu.opencl.enable = true;

  # Cấp phép bộ đệm GTT để iGPU mượn linh hoạt dung lượng RAM hệ thống
  boot.kernelParams = [
    "amdgpu.gttsize=16384"
  ];

  # Compatibility baseline: change only after reviewing NixOS migration notes.
  system.stateVersion = "26.05";
}
