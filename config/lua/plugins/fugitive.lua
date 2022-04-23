local map = vim.api.nvim_set_keymap

map('n', '<leader>G', ':call StartDiff()<CR>', { silent = true, noremap = true })

vim.cmd [[
  fun! StartDiff()
    if expand('%') == ''
      echo 'Error: can not diff here'
      retu
    endif
    exe 'Gvdiffsplit'
  endf
]]

map('n', '<leader>g', ':Git blame<CR>', { noremap = true })

-- close blame window with q
vim.cmd [[
  au FileType fugitiveblame nmap <silent> <buffer> q gq
  au FileType fugitiveblame nmap <silent> <buffer> <leader>g gq
]]

-- disable buffer navigation inside of the blame window
vim.cmd [[
  au FileType fugitiveblame nnoremap <silent> <buffer> h <Nop>
  au FileType fugitiveblame nnoremap <silent> <buffer> l <Nop>
]]

-- close diff window with q
vim.cmd [[
  au FileType git nnoremap <silent> <buffer> q :bdelete<CR>
]]

-- disable buffer navigation inside of the diff window
vim.cmd [[
  au FileType git nnoremap <silent> <buffer> h <Nop>
  au FileType git nnoremap <silent> <buffer> l <Nop>
]]
