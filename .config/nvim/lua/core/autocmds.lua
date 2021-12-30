U.nvim_create_augroups({
  -- formatopts = {
  --   { 'BufNewFile,BufRead', '*', 'setlocal formatoptions-=o' }
  -- }
  general = {
    { "BufWinEnter", "*", "set fo-=o" }, -- Avoid newline continuation of comments
    { "BufEnter", "*", "silent! lcd %:p:h" },
  },
})
