local telescope = require('telescope')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local make_entry = require('telescope.make_entry')
local previewers = require('telescope.previewers')
local utils = require('telescope.utils')
local conf = require('telescope.config').values

telescope.setup{
  defaults = {
    layout_strategy='vertical',
    layout_config = {
      vertical = { width = 0.8 }
    }
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    }
  },
}


M = {}

M.find_dots = function(opts)
  opts.shorten_path = utils.get_default(opts.shorten_path, true)
  opts = opts or {}
  --
  opts.cwd = os.getenv("HOME").."/Documents/GitHub/dotfiles/"
  -- By creating the entry maker after the cwd options,
  -- we ensure the maker uses the cwd options when being created.
  opts.entry_maker = opts.entry_maker or make_entry.gen_from_file(opts)

  pickers.new(opts, {
    prompt_title = '~~ Dotfiles ~~',
    finder = finders.new_oneshot_job(
      { "git",
      "--git-dir="..os.getenv("HOME").."/Documents/GitHub/dotfiles/.git",
      "--work-tree="..os.getenv("HOME").."/Documents/GitHub/dotfiles/",
      "ls-tree", "--full-tree", "-r", "--name-only", "HEAD" },
      opts
    ),
    previewer = previewers.vim_buffer_cat.new(opts),
    sorter = conf.file_sorter(opts),
  }):find()
end

M.find_wiki = function(opts)
  opts.shorten_path = utils.get_default(opts.shorten_path, true)
  opts = opts or {}
  --
  opts.cwd = os.getenv("HOME").."/vimwiki/"
  -- By creating the entry maker after the cwd options,
  -- we ensure the maker uses the cwd options when being created.
  opts.entry_maker = opts.entry_maker or make_entry.gen_from_file(opts)

  pickers.new(opts, {
    prompt_title = '~~ Wiki ~~',
    finder = finders.new_oneshot_job(
      { "git",
      "--git-dir="..os.getenv("HOME").."/vimwiki/Notes/.git",
      "--work-tree="..os.getenv("HOME").."/vimwiki/Notes/",
      "ls-tree", "--full-tree", "-r", "--name-only", "HEAD" },
      opts
    ),
    previewer = previewers.vim_buffer_cat.new(opts),
    sorter = conf.file_sorter(opts),
  }):find()
end


return M
