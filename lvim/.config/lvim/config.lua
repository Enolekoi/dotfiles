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

lvim.keys.normal_mode["K"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["H"] = ":BufferLineCyclePrev<CR>"
-- Lvim specific settings
lvim.transparent_window = true
-- User Plugins
lvim.plugins = {
  { "catppuccin/nvim"},
  { "norcalli/nvim-colorizer.lua"},
  { "HiPhish/rainbow-delimiters.nvim"},
  { 'alexghergh/nvim-tmux-navigation', config = function()
    local nvim_tmux_nav = require('nvim-tmux-navigation')
    nvim_tmux_nav.setup {
        disable_when_zoomed = true -- defaults to false
    }

    vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
    vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
    vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
    vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
    vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
    vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
  
  end
  },
  { "jose-elias-alvarez/null-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.diagnostics.ruff,
        null_ls.builtins.formatting.black,
      }
    })
  end
  },
}

require('nvim-treesitter.configs').setup {
  rainbow = {
  enable = true,
  -- list of languages you want to disable the plugin for
  disable = {},
  -- Which query to use for finding delimiters
  query = 'rainbow-parens',
  -- Highlight the entire buffer all at once
  -- strategy = require('ts-rainbow').strategy.global,
  }
}
