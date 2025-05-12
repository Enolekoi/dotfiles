-- Sync Neovim clipboard with system clipboard (turned off)
-- vim.opt.clipboard:append('unnamedplus')  -- Linux/WSL

-- Cursor
-- vim.opt.guicursor

-- Line Numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Tabs
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Smart Indenting
vim.opt.smartindent = true

-- Turn off line wrapping
vim.opt.wrap = false

-- Undo of old changes
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Search options
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Better colors
vim.opt.termguicolors = true

-- Scrolloff (when scrolling there are always 8 lines left at the bottom/top)
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Fast update time
vim.opt.updatetime = 50

-- Line at column 80
vim.opt.colorcolumn = "80"

-- Define Leader Key
vim.g.mapleader = " "
