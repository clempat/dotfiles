local M = {}

M.setup_lsp = function(attach, capabilities)
   local lsp_installer = require "nvim-lsp-installer"

   -- Include the servers you want to have installed by default below
   -- https://github.com/williamboman/nvim-lsp-installer#available-lsps
   local servers = {
      "tsserver",
      "yamlls",
      "graphql",
      "dockerls",
      "stylelint_lsp",
      "cssls",
      "html",
      "ember",
      "tailwindcss",
      "golangci_lint_ls",
      "gopls",
      "jdtls",
   }

   -- install all those servers
   for _, name in pairs(servers) do
      local server_is_found, server = lsp_installer.get_server(name)
      if server_is_found then
         if not server:is_installed() then
            print("Installing " .. name)
            server:install()
         end
      end
   end

   lsp_installer.settings {
      ui = {
         icons = {
            server_installed = "﫟",
            server_pending = "",
            server_uninstalled = "✗",
         },
      },
   }

   lsp_installer.on_server_ready(function(server)
      local opts = {
         on_attach = attach,
         capabilities = capabilities,
         flags = {
            debounce_text_changes = 150,
         },
         settings = {},
      }

      -- basic example to edit lsp server's options, disabling tsserver's inbuilt formatter
      if server.name == "tsserver" then
         opts.on_attach = function(client, bufnr)
            client.resolved_capabilities.document_formatting = false
            vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})
         end
      end

      if server.name == "stylelint_lsp" then
         opts.on_attach = function(client)
            client.resolved_capabilities.document_formatting = false
         end
      end

      server:setup(opts)
      vim.cmd [[ do User LspAttachBuffers ]]
   end)
end

return M
