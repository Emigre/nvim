local map = vim.api.nvim_set_keymap

-- <leader>; ... definition (go to definition)
map('n', '<leader>;', ':call LSPGoToDefinition()<CR>', { silent = true })
vim.cmd [[
  fun! LSPGoToDefinition()
    call CloseFloatingWindow()
    lua vim.lsp.buf.definition()
  endfun
]]

-- R ... references (show references)
map('n', 'R', ':call LSPShowReferences()<CR>', { silent = true, noremap = true })
vim.cmd [[
  fun! LSPShowReferences()
    call CloseFloatingWindow()
    lua vim.lsp.buf.references()
  endfun
]]

-- t ... hover (show type definition)
map('n', 't', ':call LSPShowTypeDefinition()<CR>', { silent = true, noremap = true })
vim.cmd [[
  fun! LSPShowTypeDefinition()
    lua vim.lsp.buf.hover()
  endfun
]]

-- nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
-- nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
-- nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>

-- nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
-- nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

-- nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>

--

-- nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
-- nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
-- nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
-- nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
-- nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
-- nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>

--

-- " Set updatetime for CursorHold
-- " 300ms of no cursor movement to trigger CursorHold
-- set updatetime=300

-- " Show diagnostic popup on cursor hold
-- autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

-- " have a fixed column for the diagnostics to appear in
-- " this removes the jitter when warnings/errors flow in
-- set signcolumn=yes

-- use format-on-write (with a timeout of 200ms)
-- autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)
-- Check out :help lsp for more information
