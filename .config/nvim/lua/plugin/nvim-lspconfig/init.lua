local lspconfig = require('lspconfig')
-- require('plugin.nvim-lspconfig.handlers')
local on_attach_common = require('plugin.nvim-lspconfig.on-attach')
local on_init_common = require('plugin.nvim-lspconfig.on-init')
local capabilities = require('plugin.nvim-lspconfig.capabilities')
local lsp_defaults = lspconfig.util.default_config

-- local capabilities = require('cmp_nvim_lsp').default_capabilities()

lsp_defaults.capabilities =
  vim.tbl_deep_extend('force', lsp_defaults.capabilities, require('cmp_nvim_lsp').default_capabilities())

local servers = {
  lua_ls = require('plugin.nvim-lspconfig.server-configs.sumneko').config,
  -- tsserver = require('plugin.nvim-lspconfig.server-configs.tsserver').config,
  -- clangd = { filetypes = { 'glsl', 'c' } },
  pyright = { require('lspconfig').pyright },
  html = { require('lspconfig').html },
  cssls = { cmd = { 'vscode-css-language-server', '--stdio' } },
  emmet_ls = { filetypes = { 'javascript', 'html' } },
  arduino_language_server = {
    filetypes = { 'arduino' },
    cmd = {
      '/Users/juanedflores/tools/arduino-language-server/arduino-language-server',
      '-clangd',
      '/Users/juanedflores/.local/share/nvim/mason/packages/clangd/clangd_19.1.2/bin/clangd',
      '-cli',
      '/Users/juanedflores/tools/arduino-cli_0.35.3_macOS_ARM64/arduino-cli',
      '-cli-config',
      '/Users/juanedflores/.arduinoIDE/arduino-cli.yaml',
      '-fqbn',
      'arduino:uvr:uno',
    },
    capabilities = {
      textDocument = {
        semanticTokens = vim.NIL,
      },
      workspace = {
        semanticTokens = vim.NIL,
      },
    },
  },
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
      -- capabilities = capabilities,
      html = {
        format = { enable = 'false' },
      },
    }, opts))
  end
end

require('plugin.null-ls').setup()

-- local null_ls = require('plugin.null-ls')

-- null_ls.setup({
--   on_attach = function(client, bufnr)
--     local augroup = vim.api.nvim_create_augroup('null_format', { clear = true })
--     vim.api.nvim_create_autocmd('BufWritePre', {
--       group = augroup,
--       buffer = bufnr,
--       desc = 'Fix and format',
--       callback = function()
--         vim.cmd('EslintFixAll')
--         vim.lsp.buf.format({ id = client.id })
--       end,
--     })
--   end,
--   sources = {
--     null_ls.builtins.formatting.prettier.with({
--       prefer_local = 'node_modules/.bin',
--     }),
--   },
-- })
