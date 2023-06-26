local lspconfig = require('lspconfig')
-- require('plugin.nvim-lspconfig.handlers')
local on_attach_common = require('plugin.nvim-lspconfig.on-attach')
local on_init_common = require('plugin.nvim-lspconfig.on-init')
local capabilities = require('plugin.nvim-lspconfig.capabilities')
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

local servers = {
  lua_ls = require('plugin.nvim-lspconfig.server-configs.sumneko').config,
  -- tsserver = require('plugin.nvim-lspconfig.server-configs.tsserver').config,
  clangd = { filetypes = { 'glsl', 'c', 'arduino', 'processing' } },
  pyright = { require('lspconfig').pyright },
  html = { require('lspconfig').html },
  cssls = { cmd = { 'vscode-css-language-server', '--stdio' } },
  emmet_ls = { filetypes = { 'javascript' } },
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
