{ pkgs, ... }:

{
  programs.firefox.enable = true;

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

  #Git
  programs.git = {
    enable = true;
    settings.user ={
      name = "Neo";
      email = "wheelhousemaris@gmail.com";
    };
  };

  # Wezterm
  programs.wezterm = {
    enable = true;
    extraConfig = builtins.readFile ./wezterm/wezterm.lua;
  };

  # Zeditor
  programs.zed-editor = {
      enable = true;
      userSettings = builtins.fromJSON (builtins.readFile ./zed/settings.json);
  };

  # Neovim
  programs.neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;

      plugins = with pkgs.vimPlugins; [
        catppuccin-nvim
        telescope-nvim
        (nvim-treesitter.withPlugins (plugins: [
          plugins.tree-sitter-lua
          plugins.tree-sitter-nix
          plugins.tree-sitter-javascript
          plugins.tree-sitter-typescript
        ]))
      ];

      initLua = builtins.readFile ./neovim/init.lua;
    };
}
