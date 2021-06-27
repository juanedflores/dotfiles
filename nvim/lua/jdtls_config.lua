local M = {}
function M.setup()
  vim.cmd[[set softtabstop=2]]
  vim.cmd[[set shiftwidth=2]]
  vim.cmd[[set noexpandtab]]

  -- local function jdtls_on_attach(client, bufnr)
  --   on_attach(client, bufnr)
  --   local opts = { silent = true; }
  --   require('jdtls').setup_dap({ hotcodereplace = 'auto' })
  --   -- require('jdtls').test_class()
  --   -- require('jdtls').test_nearest_method()
  -- require('jdtls.dap').setup_dap_main_class_configs()
  --   api.nvim_buf_set_keymap(bufnr, "n", "<A-o>", "<Cmd>lua require'jdtls'.organize_imports()<CR>", opts)
  --   api.nvim_buf_set_keymap(bufnr, "n", "<leader>df", "<Cmd>lua require'jdtls'.test_class()<CR>", opts)
  --   api.nvim_buf_set_keymap(bufnr, "n", "<leader>dn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", opts)
  --   api.nvim_buf_set_keymap(bufnr, "v", "crv", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", opts)
    -- api.nvim_buf_set_keymap(bufnr, "n", "crv", "<Cmd>lua require('jdtls').extract_variable()<CR>", opts)
    -- api.nvim_buf_set_keymap(bufnr, "v", "crm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", opts)
  -- end

  local config = {}
  config.cmd = {'java-lsp.sh'}
  config.on_attach = jdtls_on_attach

  config['on_attach'] = function(client, bufnr)
    -- With `hotcodereplace = 'auto' the debug adapter will try to apply code changes
    -- you make during a debug session immediately.
    -- Remove the option if you do not want that.
    require('jdtls').setup_dap({ hotcodereplace = 'auto' })
  end

  local jar_patterns = {
    "/Users/juaneduardoflores/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar",
    "/Users/juaneduardoflores/vscode-java-test/server/*.jar",
  }
  local bundles = {}
  for _, jar_pattern in ipairs(jar_patterns) do
    for _, bundle in ipairs(vim.split(vim.fn.glob(jar_pattern), '\n')) do
      if not vim.endswith(bundle, 'com.microsoft.java.test.runner.jar') then
        table.insert(bundles, bundle)
      end
    end
  end

  config.init_options = {
    bundles = bundles;
    -- bundles = {
    --   vim.fn.glob("/Users/juaneduardoflores/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar")
    -- }
  }

  require('jdtls.setup').add_commands()
  -- require('jdtls.dap').setup_dap_main_class_configs()

  vim.list_extend(bundles, vim.split(vim.fn.glob("/users/juaneduardoflores/vscode-java-test/server/*.jar"), "\n"))
  config['init_options'] = {
    bundles = bundles;
  }

  require('jdtls').start_or_attach(config)

  -- Utility servers
  local map = function(type, key, value)
    vim.api.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true});
  end

  -- local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  -- GOTO mappings
  local opts = { noremap=true, silent=true }
  map('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
  map('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>')
  map('n','K','<cmd>lua vim.lsp.buf.hover()<CR>')
  map('n','gr','<cmd>lua vim.lsp.buf.references()<CR>')
  map('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
  map('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
  map('n','<leader>gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
  map('n','<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
  map('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
  -- ACTION mappings
  map('n','<leader>ah',  '<cmd>lua vim.lsp.buf.hover()<CR>')
  map('n','<leader>ca', '<cmd>lua require"jdtls".code_action()<CR>')
  map('n','<leader>ar',  '<cmd>lua vim.lsp.buf.rename()<CR>')
  -- Few language severs support these three
  map('n','<leader>cf',  '<cmd>lua vim.lsp.buf.formatting()<CR>')
  map('n','<leader>ai',  '<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
  map('n','<leader>ao',  '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
  -- Diagnostics mapping
  map('n','<leader>ee', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
  map('n','<leader>en', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
  map('n','<leader>ep', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
  -- Debugging
  map("n","<leader>r", "<cmd>lua require('dap').continue()<CR>")
  map("n","<leader>tb", "<cmd>lua require('dap').toggle_breakpoint()<CR>")

  map('n', [[<leader>ai]], [[<Cmd>lua require'jdtls'.organize_imports()<CR>]])
  map('n', [[<leader>av]], [[<Cmd>lua require('jdtls').extract_variable()<CR>]])
  map('v', [[<leader>av]], [[<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>]])
  map('v', [[<leader>am]], [[<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>]])
  map('n', [[<leader>aR]], [[<Cmd>lua require('jdtls').code_action(false, 'refactor')<CR>]])

-- local jdtls_ui = require'jdtls.ui'
-- function jdtls_ui.pick_one_async(items, _, _, cb)
--   require'lsputil.codeAction'.code_action_handler(nil, nil, items, nil, nil, nil, cb)
-- end
--   vim.cmd[[command! -buffer JdtCompile lua require('jdtls').compile()]]
--   vim.cmd[[command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()]]
--   vim.cmd[[command! -buffer JdtJol lua require('jdtls').jol()]]
--   vim.cmd[[command! -buffer JdtBytecode lua require('jdtls').javap()]]
--   vim.cmd[[command! -buffer JdtJshell lua require('jdtls').jshell()]]
-- vim.g.lsp_utils_location_opts = {
--     height = 24,
--     mode = 'split',
--     list = {
-- 	border = true,
-- 	numbering = true
--     },
--     preview = {
-- 	title = 'Location Preview',
-- 	border = true,
--     },
-- }


-- vim.g.lsp_utils_symbols_opts = {
--     height = 24,
--     mode = 'editor',
--     list = {
-- 	border = true,
-- 	numbering = false,
--     },
--     preview = {
-- 	title = 'Symbols Preview',
-- 	border = true,
--     },
--     prompt = {}
-- }
-- vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
-- vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
-- vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
-- vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
-- vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
-- vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
-- vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
-- vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler
end

return M
