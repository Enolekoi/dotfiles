return {
  'tpope/vim-fugitive',

  -- configuration function
  config = function()
    -- keybindings
    vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
  end
}
