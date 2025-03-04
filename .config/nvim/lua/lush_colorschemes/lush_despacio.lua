local lush = require('lush')
local hsl = lush.hsl

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  -- you probably want to alias it locally
  local sym = injected_functions.sym
  return {
    Normal({ bg = hsl('#222222') }),
    -- Normal({ bg = hsl('#303030'), fg = hsl('#768390') }),
    Comment({ fg = hsl('#626262') }),
    String({ fg = hsl('#5f8787') }), --   a string constant: "this is a string"
    -- Character { }, --  a character constant: 'c', '\n'
    -- Number         { }, --   a number constant: 234, 0xff
    -- Boolean        { }, --  a boolean constant: TRUE, false
    -- Float          { }, --    a floating point constant: 2.3e10
    PreProc({ fg = hsl('#d7875f') }),
    Function({ fg = hsl('#d7875f') }), -- function name (also: methods for classes)
    Identifier({ fg = hsl('#dfaf87') }), -- (preferred) any variable name
    Statement({ fg = hsl('#af875f') }), -- (preferred) any statement
    Constant({ fg = hsl('#d78700') }), -- (preferred) any constant
    Type({ fg = hsl('#d78700') }), -- (preferred) int, long, char, etc.
    -- Structure { }, --  struct, union, enum, etc.
    Special({ fg = hsl('#875f5f') }),
    Conditional({ fg = hsl('#875f5f') }), --  if, then, else, endif, switch, etc.
    Operator({ fg = hsl('#949494') }), -- "sizeof", "+", "*", etc.
    -- Repeat         { }, --   for, do, while, etc.
    -- Label          { }, --    case, default, etc.
    -- Keyword        { }, --  any other keyword
    -- Exception      { }, --  try, catch, throw
    Title({ fg = hsl('#d7875f') }), -- titles for output from ":set all", ":autocmd" etc.
    StorageClass({ fg = hsl('#dfaf87') }), -- static, register, volatile, etc.
    htmlItalic({ fg = hsl('#ff875f') }),
    htmlEndTag({ fg = hsl('#dfaf87') }),
    cssTagName({ fg = hsl('#ff875f') }),
    cssClassName({ fg = hsl('#ff875f') }),
    cssIdentifier({ fg = hsl('#ff875f') }),
    -- WINDOW UI
    MoreMsg({ fg = hsl('#af875f') }),
    SpecialComment({ fg = hsl('#767676') }), -- special things inside a comment
    VimCommentTitle({ fg = hsl('#767676') }),
    Underlined({ gui = 'underline', fg = hsl('#87afaf') }), -- (preferred) text that stands out, HTML links
    Bold({ gui = 'bold', fg = '#ffffff' }),
    Italic({ gui = 'italic' }),
    -- FoldColumn({ fg = hsl('#87afaf') }),
    FoldColumn({ fg = hsl('#303030') }),
    Todo({ fg = hsl('#d78700') }), -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    Visual({ fg = '#121212', bg = '#dfaf00' }), -- Visual mode selection
    Question({ fg = hsl('#af875f') }),
    Search({ fg = hsl('#000000'), bg = hsl('#87afaf') }),
    MatchParen({ bg = hsl('#d78700') }), -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    Error({ fg = hsl('#d75f5f'), bg = hsl('#121212') }), -- (preferred) any erroneous construct
    ErrorMsg({ fg = hsl('#d75f5f') }), -- error messages on the command line
    WarningMsg({ fg = hsl('#ff875f') }), -- warning messages
    netrwExe({ fg = hsl('#5f8787') }),
    netrwlist({ fg = hsl('#875f5f') }),
    Directory({ fg = hsl('#af875f') }), -- directory names (and other special names in listings)
    LineNr({ fg = '#4e4e4e' }), -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr({ fg = hsl('#c6c6c6') }), -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    WildMenu({ fg = hsl('#c6c6c6') }),
    ModeMsg({ fg = hsl('#dfdfdf') }), -- 'showmode' message (e.g., "-- INSERT -- ")
    SignColumn({ fg = hsl('#87af87') }),
    -- MORE WINDOW UI
    ColorColumn({ bg = hsl('#303030') }), -- used for the columns set with 'colorcolumn'
    Conceal({ fg = '#076678' }), -- placeholder characters substituted for concealed text (see 'conceallevel')
    DiffAdd({ fg = '#87afaf' }), -- diff mode: Added line |diff.txt|
    DiffChange({ fg = '#87afaf' }), -- diff mode: Changed line |diff.txt|
    DiffDelete({ fg = '#5f8787' }), -- diff mode: Deleted line |diff.txt|
    DiffText({ fg = '#af5f5f' }), -- diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer({ fg = '#303030' }), -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    Folded({ fg = hsl('#af875f'), bg = hsl('#262626') }), -- line used for closed folds
    -- TermCursor { }, -- cursor in a focused terminal
    -- TermCursorNC { }, -- cursor in an unfocused terminal
    VertSplit({ fg = '#444444' }), -- the column separating vertically split windows
    -- FoldColumn   { }, -- 'foldcolumn'
    -- SignColumn   { }, -- column where |signs| are displayed
    -- IncSearch    { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    -- Substitute   { }, -- |:substitute| replacement text highlighting
    -- MsgArea      { }, -- Area for messages and cmdline
    -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    -- MoreMsg      { }, -- |more-prompt|
    NonText({ fg = '#444444' }), -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    -- Normal       { }, -- normal text
    -- NormalFloat  { }, -- Normal text in floating windows.
    -- NormalNC     { }, -- normal text in non-current windows
    Pmenu({ fg = '#767676', bg = '#3a3a3a' }), -- Popup menu: normal item.
    PmenuSel({ fg = '#eeeeee', bg = '#3a3a3a' }), -- Popup menu: selected item.
    PmenuSbar({ fg = '#3a3a3a', bg = '#3a3a3a' }), -- Popup menu: scrollbar.
    PmenuThumb({ fg = '#3a3a3a', bg = '#3a3a3a' }), -- Popup menu: Thumb of the scrollbar.
    -- Question     { }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    -- Search       { }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    SpecialKey({ fg = '#444444' }), -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    -- SpellBad     { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    StatusLine({ fg = '#eeeeee', bg = '#262626' }), -- status line of current window
    StatusLineNC({ fg = '#767676', bg = '#262626' }), -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine({ fg = '#767676', bg = '#262626' }), -- tab pages line, not active tab page label
    TabLineFill({ fg = '', bg = '#262626' }), -- tab pages line, where there are no labels
    TabLineSel({ fg = '#eeeeee', bg = '#262626' }), -- tab pages line, active tab page label
    -- VisualNOS    { }, -- Visual mode selection when vim is "Not Owning the Selection".
    -- Whitespace   { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- WildMenu     { }, -- current match in 'wildmenu' completion

    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.
    -- PreProc        { }, -- (preferred) generic Preprocessor
    -- Include        { }, --  preprocessor #include
    -- Define         { }, --   preprocessor #define
    -- Macro          { }, --    same as Define
    -- PreCondit      { }, --  preprocessor #if, #else, #endif, etc.

    -- Typedef        { }, --  A typedef

    -- Special        { }, -- (preferred) any special symbol
    -- SpecialChar    { }, --  special character in a constant
    -- Tag            { }, --    you can use CTRL-] on this
    -- Delimiter      { }, --  character that needs attention
    -- Debug          { }, --    debugging statements

    -- ("Ignore", below, may be invisible...)
    -- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

    -- These groups are for the native LSP client. Some other LSP clients may
    -- use these groups, or use their own. Consult your LSP client's
    -- documentation.

    -- LspReferenceText                     { }, -- used for highlighting "text" references
    -- LspReferenceRead                     { }, -- used for highlighting "read" references
    -- LspReferenceWrite                    { }, -- used for highlighting "write" references

    -- LspDiagnosticsDefaultError           { }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    -- LspDiagnosticsDefaultWarning         { }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    -- LspDiagnosticsDefaultInformation     { }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    -- LspDiagnosticsDefaultHint            { }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)

    -- LspDiagnosticsVirtualTextError       { }, -- Used for "Error" diagnostic virtual text
    -- LspDiagnosticsVirtualTextWarning     { }, -- Used for "Warning" diagnostic virtual text
    -- LspDiagnosticsVirtualTextInformation { }, -- Used for "Information" diagnostic virtual text
    -- LspDiagnosticsVirtualTextHint        { }, -- Used for "Hint" diagnostic virtual text

    -- LspDiagnosticsUnderlineError         { }, -- Used to underline "Error" diagnostics
    -- LspDiagnosticsUnderlineWarning       { }, -- Used to underline "Warning" diagnostics
    -- LspDiagnosticsUnderlineInformation   { }, -- Used to underline "Information" diagnostics
    -- LspDiagnosticsUnderlineHint          { }, -- Used to underline "Hint" diagnostics

    -- LspDiagnosticsFloatingError          { }, -- Used to color "Error" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingWarning        { }, -- Used to color "Warning" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingInformation    { }, -- Used to color "Information" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingHint           { }, -- Used to color "Hint" diagnostic messages in diagnostics float

    -- LspDiagnosticsSignError              { }, -- Used for "Error" signs in sign column
    -- LspDiagnosticsSignWarning            { }, -- Used for "Warning" signs in sign column
    -- LspDiagnosticsSignInformation        { }, -- Used for "Information" signs in sign column
    -- LspDiagnosticsSignHint               { }, -- Used for "Hint" signs in sign column

    -- LspCodeLens                          { }, -- Used to color the virtual text of the codelens

    -- These groups are for the neovim tree-sitter highlights.
    -- As of writing, tree-sitter support is a WIP, group names may change.
    -- By default, most of these groups link to an appropriate Vim group,
    -- TSError -> Error for example, so you do not have to define these unless
    -- you explicitly want to support Treesitter's improved syntax awareness.

    -- TSAnnotation         { };    -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    -- TSAttribute          { };    -- (unstable) TODO: docs
    -- TSBoolean            { };    -- For booleans.
    -- TSCharacter          { };    -- For characters.
    -- TSComment            { };    -- For comment blocks.
    -- TSConstructor        { };    -- For constructor calls and definitions: ` { }` in Lua, and Java constructors.
    -- TSConditional        { };    -- For keywords related to conditionnals.
    -- TSConstant           { };    -- For constants
    -- TSConstBuiltin       { };    -- For constant that are built in the language: `nil` in Lua.
    -- TSConstMacro         { };    -- For constants that are defined by macros: `NULL` in C.
    -- TSError              { };    -- For syntax/parser errors.
    -- TSException          { };    -- For exception related keywords.
    -- TSField              { };    -- For fields.
    -- TSFloat              { };    -- For floats.
    -- TSFunction           { };    -- For function (calls and definitions).
    -- TSFuncBuiltin        { };    -- For builtin functions: `table.insert` in Lua.
    -- TSFuncMacro          { };    -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    -- TSInclude            { };    -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    -- TSKeyword            { };    -- For keywords that don't fall in previous categories.
    -- TSKeywordFunction    { };    -- For keywords used to define a fuction.
    -- TSLabel              { };    -- For labels: `label:` in C and `:label:` in Lua.
    -- TSMethod             { };    -- For method calls and definitions.
    -- TSNamespace          { };    -- For identifiers referring to modules and namespaces.
    -- TSNone               { };    -- TODO: docs
    -- TSNumber             { };    -- For all numbers
    -- TSOperator           { };    -- For any operator: `+`, but also `->` and `*` in C.
    -- TSParameter          { };    -- For parameters of a function.
    -- TSParameterReference { };    -- For references to parameters of a function.
    -- TSProperty           { };    -- Same as `TSField`.
    -- TSPunctDelimiter     { };    -- For delimiters ie: `.`
    -- TSPunctBracket       { };    -- For brackets and parens.
    -- TSPunctSpecial       { };    -- For special punctutation that does not fall in the catagories before.
    -- TSRepeat             { };    -- For keywords related to loops.
    -- TSString             { };    -- For strings.
    -- TSStringRegex        { };    -- For regexes.
    -- TSStringEscape       { };    -- For escape characters within a string.
    -- TSSymbol             { };    -- For identifiers referring to symbols or atoms.
    -- TSType               { };    -- For types.
    -- TSTypeBuiltin        { };    -- For builtin types.
    -- TSVariable           { };    -- Any variable name that does not have another highlight.
    -- TSVariableBuiltin    { };    -- Variable names that are defined by the languages, like `this` or `self`.

    -- TSTag                { };    -- Tags like html tag names.
    -- TSTagDelimiter       { };    -- Tag delimiter like `<` `>` `/`
    -- TSText               { };    -- For strings considered text in a markup language.
    -- TSEmphasis           { };    -- For text to be represented with emphasis.
    -- TSUnderline          { };    -- For text to be represented with an underline.
    -- TSStrike             { };    -- For strikethrough text.
    -- TSTitle              { };    -- Text that is part of a title.
    -- TSLiteral            { };    -- Literal text.
    -- TSURI                { };    -- Any URI like a link or email.
    -- TelescopeSelection({ bg = '#87afaf' }), -- tab pages line, active tab page label
    -- TelescopeSelection({ bg = '#87afaf' }), -- tab pages line, active tab page label

    -- MARKDOWN
    sym('@text.title.1')({ fg = '#0031a9' }),
    sym('@text.title.2')({ fg = '#6f5500' }),
    sym('@text.title.3')({ fg = '#884900' }),
    sym('@text.title.4')({ fg = '#005f5f' }),
    sym('@text.title.5')({ fg = '#721045' }),
    sym('@text.title.6')({ fg = '#531ab6' }),
  }
end)

-- return our parsed theme for extension or use else where.
return theme

-- vi:nowrap
