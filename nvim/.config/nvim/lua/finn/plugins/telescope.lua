return{ 
  -- Telescope for fuzzy finding
	'nvim-telescope/telescope.nvim', version = '0.1.8',
		-- or                           branch = '0.1.x',
		dependencies = {'nvim-lua/plenary.nvim'},

  -- configuration function
  config = function()
    require('telescope').setup({})

    local builtin = require('telescope.builtin')

    -- keybindings
    vim.keymap.set('n', '<leader>pf', builtin.find_files, {desc = 'Telescope find all files'})
    vim.keymap.set('n', '<C-p>', builtin.git_files, {desc = 'Telescope find git files'})
    vim.keymap.set('n', '<leader>ps', function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") });
    end, {desc = 'Telescope ...'}) 
  end
}
