local on_attach = require('plugin.nvim-lspconfig.on-attach')
local on_init = require('plugin.nvim-lspconfig.on-init')

local M = {}

local sumneko_root_path = '/Users/juanedflores/tools/lua-language-server'

local sumneko_binary = sumneko_root_path .. '/bin' .. '/lua-language-server'

M.config = {
  cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' },
  on_attach = on_attach,
  on_init = on_init,
  settings = {
    Lua = {
      completion = {
        enable = true,
        callSnippet = 'Replace',
        showWord = 'Disable',
      },
      runtime = {
        version = 'LuaJIT',
        path = (function()
          local runtime_path = vim.split(package.path, ';')
          table.insert(runtime_path, 'lua/?.lua')
          table.insert(runtime_path, 'lua/?/init.lua')
          return runtime_path
        end)(),
      },
      diagnostics = {
        enable = true,
        globals = {
          'vim',
          'describe',
          'it',
          'before_each',
          'after_each',
          'awesome',
          'theme',
          'client',
          'P',
        },
      },
      workspace = {
        preloadFileSize = 400,
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      },
    },
  },
}

return M
