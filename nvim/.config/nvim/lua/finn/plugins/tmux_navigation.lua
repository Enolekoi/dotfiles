return {
  'alexghergh/nvim-tmux-navigation',
  -- configuration function
  config = function()
    require('nvim-tmux-navigation').setup{
      disabled_when_zoomed = true -- defaults to false
    }

    -- keybindings
    local nvim_tmux_nav = require('nvim-tmux-navigation')
    
    vim.keymap.set('n', '<C-h>', nvim_tmux_nav.NvimTmuxNavigateLeft       , {desc = 'Navigate Left'})
    vim.keymap.set('n', '<C-j>', nvim_tmux_nav.NvimTmuxNavigateDown       , {desc = 'Navigate Down'})
    vim.keymap.set('n', '<C-k>', nvim_tmux_nav.NvimTmuxNavigateUp         , {desc = 'Navigate Up'})
    vim.keymap.set('n', '<C-l>', nvim_tmux_nav.NvimTmuxNavigateRight      , {desc = 'Navigate Right'})
    vim.keymap.set('n', '<C-\\>', nvim_tmux_nav.NvimTmuxNavigateLastActive, {desc = 'Navigate to last active'})
    vim.keymap.set('n', '<C-Space>', nvim_tmux_nav.NvimTmuxNavigateNext   , {desc = 'Navigate to next'})
  end
}
