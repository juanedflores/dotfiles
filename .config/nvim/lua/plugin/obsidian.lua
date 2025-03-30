require('obsidian').setup({
  conceallevel = 1,
  ui = { enable = false },
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',
  workspaces = {
    {
      name = 'personal',
      path = '/Users/juanedflores/Library/Mobile Documents/iCloud~md~obsidian/Documents/Zettelkasten',
    },
  },
  completion = {
    -- Set to false to disable completion.
    nvim_cmp = false,
    -- Trigger completion at 2 chars.
    min_chars = 2,
  },
  -- Optional, configure key mappings. These are the defaults. If you don't want to set any keymappings this
  -- way then set 'mappings = {}'.
  mappings = {
    -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
    ['gf'] = {
      action = function()
        return require('obsidian').util.gf_passthrough()
      end,
      opts = { noremap = false, expr = true, buffer = true },
    },
    -- Toggle check-boxes.
    -- ['<leader>ch'] = {
    --   action = function()
    --     return require('obsidian').util.toggle_checkbox()
    --   end,
    --   opts = { buffer = true },
    -- },
    -- Smart action depending on context, either follow link or toggle checkbox.
    -- ['<cr>'] = {
    --   action = function()
    --     return require('obsidian').util.smart_action()
    --   end,
    --   opts = { buffer = true, expr = true },
    -- },
  },
  picker = {
    -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
    name = 'telescope.nvim',
    -- Optional, configure key mappings for the picker. These are the defaults.
    -- Not all pickers support all mappings.
    note_mappings = {
      -- Create a new note from your query.
      new = '<C-x>',
      -- Insert a link to the selected note.
      insert_link = '<C-l>',
    },
    tag_mappings = {
      -- Add tag(s) to current note.
      tag_note = '<C-x>',
      -- Insert a tag at the current location.
      insert_tag = '<C-l>',
    },
  },
  disable_frontmatter = false,

  -- Optional, alternatively you can customize the frontmatter data.
  ---@return table
  note_frontmatter_func = function(note)
    -- Add the title of the note as an alias.
    if note.title then
      note:add_alias(note.title)
    end

    date = note.id:match('(%d+%-%d+%-%d+)')
    if date then
      print('date: ' .. date)
      local output = vim.fn.system("timew summary today | tail -2 | tr -d '[:space:]'")
      local hour, min, sec = output:match('(%d+):(%d+):(%d+)')
      total_seconds = (tonumber(hour) * 3600) + (tonumber(min) * 60) + tonumber(sec)
      note:add_field('time_spent', total_seconds)
    end

    -- print(total_seconds)

    -- if note.time_spent < total_seconds then
    --   print('changed')
    --   -- note.time_spent = total_seconds
    -- end

    -- if note.time_spent == nil then
    --   note.time_spent = total_seconds
    -- else if note.time_spent < total_seconds then
    --   note.time_spent = total_seconds
    -- end
    --

    local out = { id = note.id, aliases = note.aliases, tags = note.tags }
    -- local out = { id = note.id, aliases = note.aliases, tags = note.tags }

    -- `note.metadata` contains any manually added fields in the frontmatter.
    -- So here we just make sure those fields are kept in the frontmatter.
    if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
      for k, v in pairs(note.metadata) do
        out[k] = v
      end
    end

    return out
  end,

  -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
  -- URL it will be ignored but you can customize this behavior here.
  ---@param url string
  follow_url_func = function(url)
    -- Open the URL in the default web browser.
    -- vim.fn.jobstart({ 'open', url }) -- Mac OS
    -- vim.fn.jobstart({"xdg-open", url})  -- linux
    -- vim.cmd(':silent exec "!start ' .. url .. '"') -- Windows
    vim.ui.open(url) -- need Neovim 0.10.0+
  end,
})
