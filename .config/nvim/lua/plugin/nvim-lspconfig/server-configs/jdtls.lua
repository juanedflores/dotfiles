local M = {}

function M.setup()
  local config = {
    cmd = {
      "/usr/bin/java",
      "-Declipse.application=org.eclipse.jdt.ls.core.id1",
      "-Dosgi.bundles.defaultStartLevel=4",
      "-Declipse.product=org.eclipse.jdt.ls.core.product",
      "-Dlog.protocol=true",
      "-Dlog.level=ALL",
      "-noverify",
      "-Xms1g",
      "--add-modules=ALL-SYSTEM",
      "--add-opens",
      "java.base/java.util=ALL-UNNAMED",
      "--add-opens",
      "java.base/java.lang=ALL-UNNAMED",
      "-jar",
      "/Users/juaneduardoflores/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
      "-configuration",
      "/Users/juaneduardoflores/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/config_mac",
      "-data",
      "/Users/juaneduardoflores/eclipse-workspace/",
    },
    settings = {
      java = {
        configuration = {
          runtimes = {
            {
              name = "JavaSE-11",
              path = "/Library/Java/JavaVirtualMachines/jdk-11.0.13.jdk/Contents/Home",
            },
          },
        },
      },
    },
  }
  config.on_init = function(client, _)
    client.notify("workspace/didChangeConfiguration", { settings = config.settings })
  end

  local capabilities = {
    workspace = {
      configuration = true,
    },
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true,
        },
      },
    },
  }

  config.capabilities = capabilities

  config.on_attach = function(client, bufnr)
    vim.api.nvim_exec(
      [[
      augroup FormatAutoggroup
      autocmd!
      autocmd BufWritePost *.java FormatWrite
      augroup end
    ]],
      true
    )

    require("jdtls").setup_dap()
    require("jdtls.setup").add_commands()

    local buf_nmap = U.keymap.buf_nmap
    local function lua_nmap(lhs, rhs, opts)
      buf_nmap(lhs, "<cmd>lua  " .. rhs .. "<CR>", opts)
    end

    -- GOTO mappings
    lua_nmap("gD", "vim.lsp.buf.declaration()")
    lua_nmap("gd", "vim.lsp.buf.definition()")
    lua_nmap("K", "vim.lsp.buf.hover()")
    lua_nmap("gr", "vim.lsp.buf.references()")
    lua_nmap("gh", "vim.lsp.buf.signature_help()")
    lua_nmap("gi", "vim.lsp.buf.implementation()")
    -- ACTION mappings
    lua_nmap("<leader>af", "vim.lsp.buf.code_action()")
    lua_nmap("<leader>ar", "vim.lsp.buf.rename()")
    -- Few language severs support these three
    lua_nmap("<leader>ai", "vim.lsp.buf.incoming_calls()")
    lua_nmap("<leader>ao", "vim.lsp.buf.outgoing_calls()")
    -- Diagnostics mapping
    lua_nmap("<leader>ed", "vim.lsp.diagnostic.show_line_diagnostics()")
    lua_nmap("<leader>en", "vim.lsp.diagnostic.goto_next()")
    lua_nmap("<leader>ep", "vim.lsp.diagnostic.goto_prev()")
    -- Debugging
    lua_nmap("<leader>sr", "require('jdtls.dap').setup_dap_main_class_configs()")
    lua_nmap("<leader>r", "require('dap').continue()")
    lua_nmap("<leader>tb", "require('dap').toggle_breakpoint()")
  end

  local jar_patterns = {
    "/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar",
    "/vscode-java-test/server/*.jar",
  }

  local bundles = {}
  for _, jar_pattern in ipairs(jar_patterns) do
    print(jar_pattern)
    for _, bundle in ipairs(vim.split(vim.fn.glob(os.getenv("HOME") .. jar_pattern), "\n")) do
      if not vim.endswith(bundle, "com.microsoft.java.test.runner-jar-with-dependencies.jar") then
        table.insert(bundles, bundle)
      end
    end
  end
  local extendedClientCapabilities = require("jdtls").extendedClientCapabilities
  extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
  config.init_options = {
    bundles = bundles,
    extendedClientCapabilities = extendedClientCapabilities,
  }

  require("jdtls").start_or_attach(config)
end

return M
