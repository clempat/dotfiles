local M = {}

local plugin_conf = require "custom.plugins.configs"
local userPlugins = require "custom.plugins"

M.plugins = {
   status = {
      colorizer = true,
   },

   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },

   default_plugin_config_replace = {
      nvim_treesitter = plugin_conf.treesitter,
      nvim_tree = plugin_conf.nvimtree,
      nvim_cmp = plugin_conf.cmp,
   },

   install = userPlugins,
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

return M
