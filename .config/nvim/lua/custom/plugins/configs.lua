local M = {}

-- overriding default plugin configs!
M.treesitter = {
   ensure_installed = {
      "typescript",
      "lua",
      "vim",
      "html",
      "css",
      "javascript",
      "json",
      "toml",
      "markdown",
      "c",
      "bash",
      "dockerfile",
      "yaml",
   },
}

M.nvimtree = {
   git = {
      enable = true,
   },
}

M.cmp = {
   sources = {
      { name = "cmp_tabnine" },
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "nvim_lua" },
      { name = "path" },
   },
}

return M
