{ pkgs, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    nvim-treesitter
    telescope-nvim
    catppuccin-nvim
  ];
}
