local map = vim.api.nvim_set_keymap

map('n', '<leader>v', ':SymbolsOutline<CR>', { silent = true, noremap = true })

-- disable buffer navigation
vim.cmd [[
  au FileType Outline noremap <silent> <buffer> h <Nop>
  au FileType Outline noremap <silent> <buffer> l <Nop>
]]

vim.cmd [[
  function! SynGroup()
      let l:s = synID(line('.'), col('.'), 1)
      echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
  endfun

  hi SymModule guifg=#ff99cc
  hi SymType guifg=#99ff99
  " hi SymFn guifg=#009900
  hi SymObj guifg=#009900
  hi SymVar guifg=#666666
  hi SymOperator guifg=#009900
]]

vim.g.symbols_outline = {
  width = 80,
  relative_width = false,
  auto_preview = true,
  keymaps = {
    goto_location = "l",
    show_help = "§"
  },
  symbols = {
    File = {icon = "⊚", hl = "SymModule"},
    Module = {icon = "⊙", hl = "SymModule"},
    Namespace = {icon = "⊛", hl = "SymModule"},
    Package = {icon = "⊡", hl = "SymModule"},

    Interface = {icon = "<Ι>", hl = "SymType"},
    Class = {icon = "<Ⅽ>", hl = "SymType"},

    Method = {icon = "λ", hl = "Function"},
    Constructor = {icon = "λ", hl = "Function"},
    Function = {icon = "λ", hl = "Function"},

    Object = {icon = "•", hl = "SymObj"},
    Array = {icon = "•", hl = "SymObj"},
    Struct = {icon = "•", hl = "SymObj"},
    Enum = {icon = "•", hl = "SymObj"},

    Field = {icon = "⁃", hl = "SymVar"},
    Variable = {icon = "⁃", hl = "SymVar"},
    Property = {icon = "⁃", hl = "SymVar"},
    Constant = {icon = "⁃", hl = "SymVar"},
    String = {icon = "⁃", hl = "SymVar"},
    Number = {icon = "⁃", hl = "SymVar"},
    Boolean = {icon = "⁃", hl = "SymVar"},
    Key = {icon = "⁃", hl = "SymVar"},
    Null = {icon = "⁃", hl = "SymVar"},
    EnumMember = {icon = "⁃", hl = "SymVar"},

    Event = {icon = "%", hl = "symOperator"},
    Operator = {icon = "%", hl = "symOperator"},
    TypeParameter = {icon = "%", hl = "symOperator"}
  }
}
