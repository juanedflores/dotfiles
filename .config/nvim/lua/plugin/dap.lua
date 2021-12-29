local dap = require("dap")
local M = {}

function M.setup()
  -- dap.adapters.java = function(callback)
  --   callback({
  --     type = "server",
  --     host = "127.0.0.1",
  --     port = 5005,
  --   })
  -- end

  -- dap.configurations.java = {
  --   {
  --     type = "java",
  --     request = "attach",
  --     name = "Debug (Attach) - Remote",
  --     javaExec = "/Library/Java/JavaVirtualMachines/jdk-11.0.13.jdk/Contents/Home/bin/java",
  --     hostName = "127.0.0.1",
  --     port = port,
  --   },
  -- }
end

M.setup()
return M
