vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
})
vim.cmd.colorscheme "catppuccin"

require('nvim-treesitter.configs').setup({
    ensure_installed = { "lua", "nix", "javascript", "typescript", "html", "css" },
    highlight = { enable = true },
})
