U.nvim_create_augroups({
  general = {
    { "BufWinEnter", "*", "set fo-=o" }, -- Avoid newline continuation of comments
  },
})
