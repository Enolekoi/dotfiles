return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'mason-org/mason.nvim',
    'mason-org/mason-lspconfig.nvim',
  },
  -- configuration function
  config = function()
    -- Enable Mason
    require('mason').setup()
    require('mason-lspconfig').setup({
      ensure_installed = {'clangd', 'bashls', 'pyright', 'lua_ls', 'markdown_oxide', 'texlab'}
    })

      -- Reserve a space in the gutter
    -- This will avoid annoying layout shifts on the screen
    vim.opt.signcolumn = 'yes'

    -- Add cmp_nvim_lsp capabilities settings to lspconfig
    -- This should be executed before configuring any language server
    local lspconfig_defaults = require('lspconfig').util.default_config
    lspconfig_defaults.capabilities = vim.tbl_deep_extend(
      'force',
      lspconfig_defaults.capabilities,
      require('cmp_nvim_lsp').default_capabilities()
    )

    --
    -- This is where features that only work if a language server
    -- is active in the file
    --
    vim.api.nvim_create_autocmd('LspAttach', {
      desc = 'LSP Actions',
      callback = function(event)
        local opts = {buffer = event.buf}

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts, {desc = 'Context sensitive info of symbol under cursor'})
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts, {desc = 'Jump to definition of symbol under cursor'})
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts, {desc = 'Jump to declaration of symbol under cursor'})
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts, {desc = 'Lists all implementations of symbol under cursor'})
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts, {desc = 'Jumps to definition of the type of the symbol under cursor'})
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts, {desc = 'Lists all references to symbol under cursor'})
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts, {desc = 'Display signature information of symbol under cursor'})
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts, {desc = 'Renames all references to symbol under cursor'})
        vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts, {desc = 'Format symbol'})
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts, {desc = 'Selects a code action'})
      end,
    })
    
    -- Autocompletion
    local cmp = require('cmp')
    
    cmp.setup({
      sources = {
        {name = 'nvim_lsp'},
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
      snippets = {
        expand = function(args)
          -- Neovim v0.10 is needed for snippet support
          vim.snippet.expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({})
    })
    
  end
}
