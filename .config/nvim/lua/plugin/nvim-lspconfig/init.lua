local lspconfig = require('lspconfig')
require('plugin.nvim-lspconfig.handlers')
local on_attach_common = require('plugin.nvim-lspconfig.on-attach')
local on_init_common = require('plugin.nvim-lspconfig.on-init')
local capabilities = require('plugin.nvim-lspconfig.capabilities')

local servers = {
  sumneko_lua = require('plugin.nvim-lspconfig.server-configs.sumneko').config,
  tsserver = require('plugin.nvim-lspconfig.server-configs.tsserver').config,
  html = { cmd = { 'vscode-html-language-server', '--stdio' } },
  cssls = { cmd = { 'vscode-css-language-server', '--stdio' } },
  clangd = { filetypes = { 'glsl', 'c', 'arduino' } },
  pyright = { cmd = { 'pyright-langserver', '--stdio' } },
}

for name, opts in pairs(servers) do
  if type(opts) == 'function' then
    opts()
  else
    local client = lspconfig[name]
    client.setup(vim.tbl_extend('force', {
      flags = { debounce_text_changes = 150 },
      on_attach = on_attach_common,
      on_init = on_init_common,
      capabilities = capabilities,
      html = {
        format = { enable = 'false' },
      },
    }, opts))
  end
end

require('plugin.null-ls').setup()
