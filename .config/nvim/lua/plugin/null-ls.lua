local M = {}

M.setup = function()
  local null_ls = require('null-ls')
  local b = null_ls.builtins

  null_ls.setup({
    debounce = 150,
    autostart = true,
    sources = {
      b.formatting.stylua.with({
        args = { '--config-path', '/Users/juanedflores/Documents/GitHub/dotfiles/stylua.toml', '-' },
      }),
      b.formatting.clang_format,
      b.formatting.autopep8,
      b.formatting.eslint_d,
      b.diagnostics.eslint_d,
      b.code_actions.eslint_d,
      b.formatting.prettier.with({
        prefer_local = '/Users/juaneduardoflores/.nvm/versions/node/v12.22.3/bin/',
        filetypes = {
          'javascript',
          'svelte',
          'json',
          'jsonc',
          'css',
          'less',
          'scss',
          'html',
          'yaml',
        },
      }),
    },
  })
end

return M
