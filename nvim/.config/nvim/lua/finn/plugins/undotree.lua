return {
  'mbbill/undotree',

  -- configuration function
  config = function()
    -- keybindings
    vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, {desc = 'Toggle undotree'})
  end
}
