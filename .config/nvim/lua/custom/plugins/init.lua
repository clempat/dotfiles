return {
	["windwp/nvim-ts-autotag"] = {
		ft = { "html", "javascriptreact" },
		after = "nvim-treesitter",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	["jose-elias-alvarez/null-ls.nvim"] = {

		after = "nvim-lspconfig",
		config = function()
			require("custom.plugins.null-ls").setup()
		end,
	},
	["nvim-telescope/telescope-media-files.nvim"] = {
		after = "telescope.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					media_files = {
						filetypes = { "png", "webp", "jpg", "jpeg" },
					},
					-- fd is needed
				},
			})
			require("telescope").load_extension("media_files")
		end,
	},
	["Pocco81/TrueZen.nvim"] = {

		cmd = {
			"TZAtaraxis",
			"TZMinimalist",
			"TZFocus",
		},
		config = function()
			require("custom.plugins.truezen").setup()
		end,
	},
	["williamboman/nvim-lsp-installer"] = {},
	["ThePrimeagen/harpoon"] = {

		after = { "plenary.nvim", "telescope.nvim" },
		config = function()
			require("telescope").load_extension("harpoon")
		end,
	},
	["tzachar/cmp-tabnine"] = {

		run = "./install.sh",
		requires = "hrsh7th/nvim-cmp",
		after = "hrsh7th/nvim-cmp",
	},
	["tpope/vim-fugitive"] = {

		"vuki656/package-info.nvim",
		requires = "MunifTanjim/nui.nvim",
	},
	["folke/trouble.nvim"] = {

		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("custom.plugins.trouble").setup()
		end,
	},
	["andweeb/presence.nvim"] = {},
	["mfussenegger/nvim-dap"] = {},
	["rcarriga/nvim-dap-ui"] = {
		requires = "mfussenegger/nvim-dap",
	},
	["theHamsta/nvim-dap-virtual-text"] = {
		requires = { "mfussenegger/nvim-dap", "nvim-treesitter/nvim-treesitter" },
	},
	["nvim-telescope/telescope-dap.nvim"] = {
		requires = { "mfussenegger/nvim-dap", "nvim-treesitter/nvim-treesitter", "nvim-telescope/telescope.nvim" },
	},
	["ThePrimeagen/git-worktree.nvim"] = {
		config = function()
			require("git-worktree").setup()
		end,
	},
}
