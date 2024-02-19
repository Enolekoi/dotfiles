-- General Settings 
vim.opt.clipboard = "unnamedplus"     -- allows LVim to access the system clipboard
vim.opt.cmdheight = 2                 -- more space in the neovim command line for displaying messages
vim.opt.shiftwidth = 2                -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2                   -- insert 2 spaces for a tab
vim.opt.relativenumber = true         -- relative line numbers
vim.opt.wrap = true                   -- wrap lines

-- use treesitter folding
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Lvim specific settings
lvim.transparent_window = true
-- User Plugins
lvim.plugins = {
  { "catppuccin/nvim"},
  { "norcalli/nvim-colorizer.lua"},
  { "HiPhish/rainbow-delimiters.nvim"},
}
require('nvim-treesitter.configs').setup {
  rainbow = {
    enable = true,
    -- list of languages you want to disable the plugin for
    disable = {},
    -- Which query to use for finding delimiters
    query = 'rainbow-parens',
    -- Highlight the entire buffer all at once
    strategy = require('ts-rainbow').strategy.global,
  }
}

lvim.keys.normal_mode["K"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["H"] = ":BufferLineCyclePrev<CR>"
