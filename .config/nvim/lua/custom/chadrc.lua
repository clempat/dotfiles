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
	},

	user = userPlugins,
}

M.ui = {
	theme = "chadracula",
}

M.options = {
	relativenumber = true,
	tabstop = 2,
	noswapfile = true,
	nohlsearch = true,
	scrollof = 8,
	noshowmode = true,
	clipboard = "",
}

M.mappings = require("custom.mappings")

return M
