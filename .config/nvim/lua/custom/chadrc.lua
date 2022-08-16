local M = {}

local plugin_conf = require("custom.plugins.configs")
local userPlugins = require("custom.plugins")

M.plugins = {
	status = {
		colorizer = true,
	},

	options = {
		lspconfig = {
			setup_lspconf = "custom.plugins.lspconfig",
		},
	},

	override = {
		["nvim-treesitter/nvim-treesitter"] = plugin_conf.treesitter,
		["kyazdani42/nvim-tree.lua"] = plugin_conf.nvimtree,
		["hrsh7th/nvim-cmp"] = plugin_conf.cmp,
		["telescope/telescope.nvim"] = plugin_conf.telescope,
	},

	user = userPlugins,
}

M.ui = {
	theme = "chadracula",
	theme_toggle = { "chadracula", "one_light" },
}

M.options = {
	user = function()
		vim.opt.relativenumber = true
		vim.opt.tabstop = 2
		-- vim.opt.nohlsearch = true
		-- vim.opt.scrollof = 8
		-- vim.opt.noshowmode = true
		vim.opt.clipboard = ""
	end,
}

M.mappings = require("custom.mappings")

return M
