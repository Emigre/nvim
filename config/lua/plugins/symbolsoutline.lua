local map = vim.api.nvim_set_keymap

map('n', '<leader>v', ':SymbolsOutline<CR>', { silent = true, noremap = true })

vim.g.symbols_outline = {
    width = 80,
}
