require('formatter').setup({
  filetype = {
    java = {
      function()
        return {
          exe = '/usr/bin/java',
          args = {
            '-jar',
            os.getenv('HOME') .. '/tools/google-java-format-1.13.0-all-deps.jar',
            vim.api.nvim_buf_get_name(0),
          },
          stdin = true,
        }
      end,
    },
  },
})
