local buf_nmap = U.keymap.buf_nmap
local function lua_nmap(lhs, rhs, opts)
  buf_nmap(lhs, '<cmd>lua  ' .. rhs .. '<CR>', opts)
end

local M = {}

M.config = {
  on_attach = function(client, bufnr)
    if client.config.flags then
      client.config.flags.allow_incremental_sync = true
    end
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    local ts_utils = require('nvim-lsp-ts-utils')
    ts_utils.setup({})
    ts_utils.setup_client(client)
    print('LSP started.')
    lua_nmap('gs', ':TSLspOrganize<CR>')
    lua_nmap('gi', ':TSLspRenameFile<CR>')
    lua_nmap('go', ':TSLspImportAll<CR>')
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
    -- lua_map('<leader>ar',  'vim.lsp.buf.rename()')
    -- Few language severs support these three
    lua_nmap('<leader>ai', 'vim.lsp.buf.incoming_calls()')
    lua_nmap('<leader>ao', 'vim.lsp.buf.outgoing_calls()')

    -- Diagnostics mapping
    lua_nmap('<leader>ed', 'vim.lsp.diagnostic.show_line_diagnostics()')
    lua_nmap('<leader>en', 'vim.lsp.diagnostic.goto_next()')
    lua_nmap('<leader>ep', 'vim.lsp.diagnostic.goto_prev()')

    lua_nmap('<leader>f', 'vim.lsp.buf.formatting()')
    vim.cmd([[autocmd! BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)]])
  end,

  -- cmd = {
  --   'typescript-language-server --stdio',
  -- },
}

return M
