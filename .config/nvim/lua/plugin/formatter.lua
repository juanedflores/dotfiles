require("formatter").setup({
  filetype = {
    java = {
      function()
        return {
          exe = "/usr/bin/java",
          args = {
            "-jar",
            os.getenv("HOME") .. "/jdt-language-server-1.6.0-202111261512/google-java-format.jar",
            vim.api.nvim_buf_get_name(0),
          },
          stdin = true,
        }
      end,
    },
  },
})
