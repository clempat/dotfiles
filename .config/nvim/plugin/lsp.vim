set completeopt=menu,menuone,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']


nnoremap <silent>gD gd
nnoremap <silent>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <silent>gr :lua vim.lsp.buf.references()<CR>
nnoremap <silent>gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <silent>K :lua vim.lsp.buf.hover()<CR>
nnoremap <silent>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>vsd :lua vim.lsp.diagnostic.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <leader>vn :lua vim.lsp.dianostic.goto_next()<CR>

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true

inoremap <silent><expr> <CR>      compe#confirm('<CR>')


lua << EOF
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lsp_installer = require "nvim-lsp-installer"

-- Include the servers you want to have installed by default below
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

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found then
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end
end

local function on_attach(client, bufnr)
  -- Set up buffer-local keymaps (vim.api.nvim_buf_set_keymap()), etc.
end

lsp_installer.on_server_ready(function(server)
  -- Specify the default options which we'll use to setup all servers
  local default_opts = {
    on_attach = on_attach,
  }

  -- Now we'll create a server_opts table where we'll specify our custom LSP server configuration
  local server_opts = {
    -- Provide settings that should only apply to the "eslintls" server
    ["html"] = function()
      default_opts.capabilities = capabilities
    end,
    ["cssls"] = function()
      default_opts.capabilities = capabilities
    end
  }

  -- Use the server's custom settings, if they exist, otherwise default to the default options
  local server_options = server_opts[server.name] and server_opts[server.name]() or default_opts
  server:setup(server_options)
end)
EOF
