local cmp = require('cmp')
-- local cmp_ultisnips_mappings = require('cmp_nvim_ultisnips.mappings')

local lsp_symbols = {
  Text = '   (Text) ',
  Method = '   (Method)',
  Function = '   (Function)',
  Constructor = '   (Constructor)',
  Field = ' ﴲ  (Field)',
  Variable = '[] (Variable)',
  Class = '   (Class)',
  Interface = ' ﰮ  (Interface)',
  Module = '   (Module)',
  Property = ' 襁 (Property)',
  Unit = '   (Unit)',
  Value = '   (Value)',
  Enum = ' 練 (Enum)',
  Keyword = '   (Keyword)',
  Snippet = '   (Snippet)',
  Color = '   (Color)',
  File = '   (File)',
  Reference = '   (Reference)',
  Folder = '   (Folder)',
  EnumMember = '   (EnumMember)',
  Constant = ' ﲀ  (Constant)',
  Struct = ' ﳤ  (Struct)',
  Event = '   (Event)',
  Operator = '   (Operator)',
  TypeParameter = '   (TypeParameter)',
}

cmp.setup({
  completion = { completeopt = 'menu,menuone,noinsert' },
  -- completion = {
  --   autocomplete = true, -- disable auto-completion.
  -- },
  snippet = {
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['ƒ'] = cmp.mapping.confirm({ select = false }),
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    -- ,
    -- ['<Tab>'] = cmp.mapping(function(fallback)
    -- cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
    -- end, { 'i', 's' }),
    -- ['<S-Tab>'] = cmp.mapping(function(fallback)
    -- cmp_ultisnips_mappings.jump_backwards(fallback)
    -- end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lua' },
    { name = 'nvim_lsp', priority = 10 },
    { name = 'path' },
    { name = 'vsnip' },
    { name = 'buffer', priority = 2, keyword_length = 5, max_item_count = 10 },
    -- { name = 'ultisnips' },
  },
  formatting = {
    format = function(entry, item)
      item.kind = lsp_symbols[item.kind]
      item.menu = ({
        buffer = '[Buffer]',
        -- ultisnips = '[Snippet]',
      })[entry.source.name]

      return item
    end,
  },
  experimental = { ghost_text = true },
})
