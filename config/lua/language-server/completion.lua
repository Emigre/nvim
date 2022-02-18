vim.g.completion_enable_fuzzy_match = 1
vim.g.completion_matching_ignore_case = 1
vim.g.completion_matching_strategy_list = { 'fuzzy', 'exact', 'substring' }
vim.g.completion_trigger_keyword_length = 2

-- improved completion
vim.cmd [[
  fun! CheckBackSpace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endf
  inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : CheckBackSpace() ? "\<Tab>" : completion#trigger_completion()
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
]]
