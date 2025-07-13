-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Bootstrap lazy.nvim

-- define a path where lazy.nvim will be installed
-- vim.fm.stdpath("data") returns neovims data directory (~/.local/share/nvim)
-- append "/lazy/lazy.nvim" to this path
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- check if lazy.nvim is not already installed in this location
-- Uses either vim.uv (Neovim 0.10+) or vim.loop (older) filesystem API
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- clone the direcory with git 
  -- --filter=blob:none: only downloads files needed for immediate use
  -- --branch=stable: clones the stable branch instead of default branch
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })

  -- Check if the git clone command failed (non-zero exit code)
  if vim.v.shell_error ~= 0 then
    -- Show error message
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    -- Wait for user to press any key
    vim.fn.getchar()
    -- Exit Neovim with error code 1
    os.exit(1)
  end
end

-- Add the lazy.nvim installation path to Neovim's runtimepath
-- prepend() puts it at the beginning so it takes precedence over other paths
vim.opt.rtp:prepend(lazypath)

return require('lazy').setup({
  spec = "finn.plugins",
  change_detection = { notify = false }
})
