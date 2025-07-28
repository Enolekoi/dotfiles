return {
  'theprimeagen/harpoon',

  -- configuration function
  config = function()
    local mark = require('harpoon.mark')
    local ui = require('harpoon.ui')

    -- keybindings
    vim.keymap.set('n', '<leader>a', mark.add_file, {desc = 'add file to harpoon'})
    vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu, {desc = 'toggle harpoon quick menu'})

    vim.keymap.set('n', '<C-1>', function() ui.nav_file(1) end, {desc = 'switch to hapoon file 1'})
    vim.keymap.set('n', '<C-2>', function() ui.nav_file(2) end, {desc = 'switch to hapoon file 2'})
    vim.keymap.set('n', '<C-3>', function() ui.nav_file(3) end, {desc = 'switch to hapoon file 3'})
    vim.keymap.set('n', '<C-4>', function() ui.nav_file(4) end, {desc = 'switch to hapoon file 4'})
  end
}
