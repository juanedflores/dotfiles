-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`

-- local tree_cb = require("nvim-tree.config").nvim_tree_callback
-- vim.g.nvim_tree_indent_markers = 1
-- vim.g.nvim_tree_width = 25
-- vim.g.nvim_tree_respect_buf_cwd = 1

require('nvim-tree').setup({
  sort_by = 'name',
  auto_reload_on_write = true,
  respect_buf_cwd = false,
  update_cwd = false,
  update_focused_file = {
    enable = true,
    update_cwd = true,
    update_root = true,
    ignore_list = {},
  },
  hijack_directories = {
    enable = false,
  },
  --   system_open = {
  --     cmd = nil,
  --     args = {},
  --   },
  --   filters = {
  --     dotfiles = false,
  --     custom = {},
  --   },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  --   view = {
  --     width = 30,
  --     height = 30,
  --     hide_root_folder = false,
  --     side = "left",
  --     auto_resize = false,
  --     mappings = {
  --       custom_only = false,
  --       list = {
  --         { key = { "<CR>", "o", "<2-LeftMouse>" }, cb = tree_cb("edit") },
  --         { key = { "<2-RightMouse>", "∂" }, cb = tree_cb("cd") },
  --         { key = "<C-v>", cb = tree_cb("vsplit") },
  --         { key = "<C-x>", cb = tree_cb("split") },
  --         { key = "<C-t>", cb = tree_cb("tabnew") },
  --         { key = "<", cb = tree_cb("prev_sibling") },
  --         { key = ">", cb = tree_cb("next_sibling") },
  --         { key = "P", cb = tree_cb("parent_node") },
  --         { key = "<BS>", cb = tree_cb("close_node") },
  --         { key = "<Tab>", cb = tree_cb("preview") },
  --         { key = "K", cb = tree_cb("first_sibling") },
  --         { key = "J", cb = tree_cb("last_sibling") },
  --         { key = "I", cb = tree_cb("toggle_ignored") },
  --         { key = "H", cb = tree_cb("toggle_dotfiles") },
  --         { key = "R", cb = tree_cb("refresh") },
  --         { key = "a", cb = tree_cb("create") },
  --         { key = "d", cb = tree_cb("remove") },
  --         { key = "D", cb = tree_cb("trash") },
  --         { key = "r", cb = tree_cb("rename") },
  --         { key = "<C-r>", cb = tree_cb("full_rename") },
  --         { key = "x", cb = tree_cb("cut") },
  --         { key = "c", cb = tree_cb("copy") },
  --         { key = "p", cb = tree_cb("paste") },
  --         { key = "y", cb = tree_cb("copy_name") },
  --         { key = "Y", cb = tree_cb("copy_path") },
  --         { key = "gy", cb = tree_cb("copy_absolute_path") },
  --         { key = "[c", cb = tree_cb("prev_git_item") },
  --         { key = "]c", cb = tree_cb("next_git_item") },
  --         { key = "-", cb = tree_cb("dir_up") },
  --         { key = "s", cb = tree_cb("system_open") },
  --         { key = "q", cb = tree_cb("close") },
  --         { key = "g?", cb = tree_cb("toggle_help") },
  --       },
  --     },
  --     number = false,
  --     relativenumber = false,
  --     signcolumn = "yes",
  --   },
  trash = {
    cmd = 'trash',
    require_confirm = false,
  },
})

-- require("nvim-tree").setup{}
