require('nvim-treesitter.configs').setup({
  highlight = { enable = true, additional_vim_regex_highlighting = false, disable = { 'html' } },
  ensure_installed = 'maintained',
  indent = { enable = false },
  -- autotag = { enable = true },
  -- context_commentstring = { enable = true, enable_autocmd = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      scope_incremental = 'grc',
      node_incremental = 'grn',
      node_decremental = 'grm',
    },
  },
})
