local presets = require('markview.presets')

require('markview').setup({
  experimental = {
    date_formats = {},
    date_time_formats = {},

    text_filetypes = {},
    read_chunk_size = 1000,
    link_open_alerts = false,
    file_open_command = 'tabnew',

    list_empty_line_tolerance = 3,
  },
  highlight_groups = {},
  preview = {
    enable = true,
    icon_provider = 'devicons',
    filetypes = { 'md', 'rmd', 'quarto', 'markdown' },
    ignore_buftypes = { 'nofile' },
    ignore_previews = {},

    modes = { 'n', 'no', 'c' },
    hybrid_modes = {},
    debounce = 50,
    draw_range = { vim.o.lines, vim.o.lines },
    edit_range = { 1, 0 },

    callbacks = {},

    splitview_winopts = { split = 'left' },
  },
  renderers = {},

  html = {
    enable = true,
    container_elements = {
      enable = true,
      -- ['blockquote'] = {
      --   on_opening_tag = {
      --     conceal = '',
      --     hl_mode = 'combine',
      --     virt_text_pos = 'inline',
      --     virt_text = { { 'INFO', 'MarkviewInlineCode' } },
      --   },
      -- on_node = { hl_group = 'Underlined' },
      -- on_closing_tag = {},
      -- },
      ['^span$'] = {
        on_opening_tag = { conceal = '' },
        on_node = { hl_group = 'Comment' },
        on_closing_tag = { conceal = '' },
      },
      ['^b$'] = {
        on_opening_tag = { conceal = '' },
        on_node = { hl_group = 'Bold' },
        on_closing_tag = { conceal = '' },
      },
      ['^code$'] = {
        on_opening_tag = {
          conceal = '',
          hl_mode = 'combine',
          virt_text_pos = 'inline',
          virt_text = { { ' ', 'MarkviewInlineCode' } },
        },
        on_node = { hl_group = 'MarkviewInlineCode' },
        on_closing_tag = {
          conceal = '',
          hl_mode = 'combine',
          virt_text_pos = 'inline',
          virt_text = { { ' ', 'MarkviewInlineCode' } },
        },
      },
      ['^em$'] = {
        on_opening_tag = { conceal = '' },
        on_node = { hl_group = '@text.emphasis' },
        on_closing_tag = { conceal = '' },
      },
      ['^i$'] = {
        on_opening_tag = { conceal = '' },
        on_node = { hl_group = 'Italic' },
        on_closing_tag = { conceal = '' },
      },
      ['^mark$'] = {
        on_opening_tag = { conceal = '' },
        on_node = { hl_group = 'MarkviewPalette1' },
        on_closing_tag = { conceal = '' },
      },
      ['^strong$'] = {
        on_opening_tag = { conceal = '' },
        on_node = { hl_group = '@text.strong' },
        on_closing_tag = { conceal = '' },
      },
      ['^sub$'] = {
        on_opening_tag = {
          conceal = '',
          hl_mode = 'combine',
          virt_text_pos = 'inline',
          virt_text = { { '↓[', 'MarkviewSubscript' } },
        },
        on_node = { hl_group = 'MarkviewSubscript' },
        on_closing_tag = {
          conceal = '',
          hl_mode = 'combine',
          virt_text_pos = 'inline',
          virt_text = { { ']', 'MarkviewSubscript' } },
        },
      },
      ['^sup$'] = {
        on_opening_tag = {
          conceal = '',
          hl_mode = 'combine',
          virt_text_pos = 'inline',
          virt_text = { { '↑[', 'MarkviewSuperscript' } },
        },
        on_node = { hl_group = 'MarkviewSuperscript' },
        on_closing_tag = {
          conceal = '',
          hl_mode = 'combine',
          virt_text_pos = 'inline',
          virt_text = { { ']', 'MarkviewSuperscript' } },
        },
      },
      ['^u$'] = {
        on_opening_tag = { conceal = '' },
        on_node = { hl_group = 'Underlined' },
        on_closing_tag = { conceal = '' },
      },
    },
    headings = {},
    void_elements = {},
  },
  latex = {
    enable = true,

    blocks = {},
    commands = {},
    escapes = {},
    fonts = {},
    inlines = {},
    parenthesis = {},
    subscripts = {},
    superscripts = {},
    symbols = {},
    texts = {},
  },
  markdown = {
    enable = true,

    block_quotes = {},
    code_blocks = {},
    -- headings = {},
    headings = presets.headings.marker,
    horizontal_rules = presets.horizontal_rules.thick,
    list_items = {},
    metadata_plus = {},
    metadata_minus = {},
    tables = {},
  },
  markdown_inline = {
    enable = true,

    block_references = {},
    checkboxes = {},
    emails = {},
    embed_files = {},
    entities = {},
    escapes = {},
    footnotes = {},
    highlights = {},
    hyperlinks = {},
    images = {},
    inline_codes = {},
    internal_links = {},
    uri_autolinks = {},
  },
  typst = {
    enable = true,

    codes = {},
    escapes = {},
    headings = {},
    labels = {},
    list_items = {},
    math_blocks = {},
    math_spans = {},
    raw_blocks = {},
    raw_spans = {},
    reference_links = {},
    subscripts = {},
    superscript = {},
    symbols = {},
    terms = {},
    url_links = {},
  },
  yaml = {
    enable = true,

    properties = {},
  },
})
