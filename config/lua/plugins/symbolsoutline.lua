local map = vim.api.nvim_set_keymap

map('n', '<leader>v', ':SymbolsOutline<CR>', { silent = true, noremap = true })

-- disable buffer navigation
vim.cmd [[
  au FileType Outline noremap <silent> <buffer> h <Nop>
  au FileType Outline noremap <silent> <buffer> l <Nop>
]]

vim.g.symbols_outline = {
  width = 60,
  relative_width = false,
  auto_preview = true,
  keymaps = {
    goto_location = "l",
    show_help = "§"
  },
  symbols = {
    File = {icon = "[file]", hl = "TSURI"},
    Module = {icon = "[modul]", hl = "TSNamespace"},
    Namespace = {icon = "[nmesp]", hl = "TSNamespace"},
    Package = {icon = "[pack]", hl = "TSNamespace"},
    Class = {icon = "(( CLASS ))", hl = "TSType"},
    Method = {icon = ">", hl = "TSMethod"},
    Property = {icon = "[prop]", hl = "TSMethod"},
    Field = {icon = "[field]", hl = "TSField"},
    Constructor = {icon = "[constr]", hl = "TSConstructor"},
    Enum = {icon = "[enum]", hl = "TSType"},
    Interface = {icon = "(( INTERFACE ))", hl = "TSType"},
    Function = {icon = ">", hl = "TSFunction"},
    Variable = {icon = "(var)", hl = "TSConstant"},
    Constant = {icon = "(const)", hl = "TSConstant"},
    String = {icon = "[str]", hl = "TSString"},
    Number = {icon = "[num]", hl = "TSNumber"},
    Boolean = {icon = "[bool]", hl = "TSBoolean"},
    Array = {icon = "[arr]", hl = "TSConstant"},
    Object = {icon = "[obj]", hl = "TSType"},
    Key = {icon = "[key]", hl = "TSType"},
    Null = {icon = "[null]", hl = "TSType"},
    EnumMember = {icon = "[enmitem]", hl = "TSField"},
    Struct = {icon = "[stru]", hl = "TSType"},
    Event = {icon = "[evt]", hl = "TSType"},
    Operator = {icon = "[op]", hl = "TSOperator"},
    TypeParameter = {icon = "[typ]", hl = "TSParameter"}
  }
}
