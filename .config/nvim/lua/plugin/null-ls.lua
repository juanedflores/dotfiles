local M = {}

M.setup = function()
  local null_ls = require("null-ls")
  local b = null_ls.builtins

  vim.env.PRETTIERD_DEFAULT_CONFIG = "~/.prettierrc"

  -- you don't have to use these helpers and could do it yourself, too
  local eslint = require("null-ls.helpers").conditional(function(utils)
    local project_local_bin = "node_modules/.bin/eslint"

    return null_ls.builtins.diagnostics.eslint.with({
      command = utils.root_has_file(project_local_bin) and project_local_bin or "eslint_d",
    })
  end)

  null_ls.setup({
    debounce = 150,
    autostart = true,
    sources = {
      b.formatting.stylua.with({
        extra_args = { "--config-path", vim.fn.expand("~/stylua.toml") },
      }),

      b.formatting.autopep8,
      b.formatting.prettier.with({
        prefer_local = "/Users/juaneduardoflores/.nvm/versions/node/v12.22.3/bin/",
        filetypes = {
          "typescriptreact",
          "typescript",
          "javascriptreact",
          "javascript",
          "svelte",
          "json",
          "jsonc",
          "css",
          "less",
          "scss",
          "html",
          "yaml",
        },
      }),
      b.formatting.stylua,
      -- b.diagnostics.shellcheck,
      -- b.code_actions.shellcheck,
      -- b.diagnostics.markdownlint,
      -- b.diagnostics.write_good,
      -- b.diagnostics.misspell,
    },
  })
end

return M
