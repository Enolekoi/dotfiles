return {
  'vimwiki/vimwiki',
  event = 'BufEnter *.md',
  keys = { '<leader>ww', '<leader>wt' },
  init = function()
    vim.g.vimwiki_list = {
      {
      path = '~/Notes/',
      syntax = 'markdown',
      ext = '.md',
      },
    }
    -- only consider markdown files in directories listed in vim.g.vimwiki_list
    vim.g.vimwiki_global_ext = 0
    -- vim.g.vimwiki_ext2syntax = {}
  end,
  lazy = false
}
