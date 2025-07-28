return {
  'folke/which-key.nvim',
  -- events = 'VimEnter',
  opts_extend = { 'spec' },
  opts = {
    delay = 800,
    preset = 'modern',
    defaults = {},
    spec = {
      mode = { 'n', 'v' },
      {'<leader>p', group = 'files'},
      {'<leader>l', group = 'LSP'},
    }
  },
  config = function()
    vim.keymap.set('n', '<leader>?', function() require("which-key").show() end, {desc = 'Buffer local keymaps (which-key)'})
  end
}
