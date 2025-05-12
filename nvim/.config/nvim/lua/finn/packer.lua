-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use {"wbthomason/packer.nvim"}
	-- Telescope for fuzzy finding
	use { 
		"nvim-telescope/telescope.nvim", tag = '0.1.8',
		-- or                           branch = '0.1.x',
		requires = { {"nvim-lua/plenary.nvim"} }
	}
	-- colorscheme
	use { "catppuccin/nvim", as = "catppuccin" }
	-- treesitter (color parsing)
	use ( "nvim-treesitter/nvim-treesitter", {run = ':TSUpdate'})
	use { "nvim-treesitter/playground"}
	-- harpoon (quick file navigation)
	use { "theprimeagen/harpoon"}
	-- undotree (undo history tree)
	use { "mbbill/undotree"}
	-- git integration
	use { "tpope/vim-fugitive"}
  -- prettier Netrw
  use {'prichrd/netrw.nvim'}
  -- tmux navigation
  use {'alexghergh/nvim-tmux-navigation'}

	-- LSP zero
	use{'neovim/nvim-lspconfig'}
	use{'hrsh7th/nvim-cmp'}
	use{'hrsh7th/cmp-nvim-lsp'}
  use{"mason-org/mason.nvim"}
  use{"mason-org/mason-lspconfig.nvim"}
end)
