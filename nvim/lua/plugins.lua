-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	-- lsp
	use("neovim/nvim-lspconfig") -- Collection of configurations for built-in LSP client
	use({ "ms-jpq/coq_nvim", run = "python3 -m coq deps" })
	use("ms-jpq/coq.artifacts")
	use("ms-jpq/coq.thirdparty")
	-- nvim tree
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional
		},
	})
	-- Beautiful statusline
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})
	-- escaping quikcly
	-- lua with packer.nvim
	use({
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup()
		end,
	})

	-- themeing
	use({ "ellisonleao/gruvbox.nvim" })
	-- formating
	use("sbdchd/neoformat")
	--telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	--dashboard
	use({
		"glepnir/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({})
		end,
		requires = { "nvim-tree/nvim-web-devicons" },
	})
	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	-- null ls lsp injection
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("null-ls").setup()
		end,
		requires = { "nvim-lua/plenary.nvim" },
	})

	use("rcarriga/nvim-notify")
end)
