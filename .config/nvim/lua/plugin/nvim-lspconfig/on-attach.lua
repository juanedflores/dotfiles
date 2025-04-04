local buf_nmap = U.keymap.buf_nmap
local function lua_nmap(lhs, rhs, opts)
  buf_nmap(lhs, '<cmd>lua  ' .. rhs .. '<CR>', opts)
end

return function(client, bufnr)
  -- client.resolved_capabilities.document_formatting = false

  print('LSP started.')

  -- GOTO mappings
  lua_nmap('gD', 'vim.lsp.buf.declaration()')
  lua_nmap('gd', 'vim.lsp.buf.definition()')
  lua_nmap('K', 'vim.lsp.buf.hover()')
  lua_nmap('gr', 'vim.lsp.buf.references()')
  lua_nmap('<space>gh', 'vim.lsp.buf.signature_help()')
  lua_nmap('gi', 'vim.lsp.buf.implementation()')
  -- ACTION mappings
  lua_nmap('<leader>af', 'vim.lsp.buf.code_action()')
  lua_nmap('<leader>ar', 'vim.lsp.buf.rename()')

  -- Few language severs support these three
  lua_nmap('<leader>ai', 'vim.lsp.buf.incoming_calls()')
  lua_nmap('<leader>ao', 'vim.lsp.buf.outgoing_calls()')

  -- Diagnostics mapping
  -- lua_nmap('<leader>ed', 'vim.lsp.diagnostic.show_line_diagnostics()')
  lua_nmap('<leader>ed', 'vim.diagnostic.open_float()')
  lua_nmap('<leader>en', 'vim.lsp.diagnostic.goto_next()')
  lua_nmap('<leader>ep', 'vim.lsp.diagnostic.goto_prev()')
  -- vim.lsp.diagnostic
  -- © is <option + c>
  lua_nmap('©', 'vim.diagnostic.enable(not vim.diagnostic.is_enabled())')

  lua_nmap('<leader>f', 'vim.lsp.buf.format()')

  -- vim.cmd([[autocmd! BufWritePre <buffer> lua vim.lsp.buf.format(nil, 1000)]])
end
