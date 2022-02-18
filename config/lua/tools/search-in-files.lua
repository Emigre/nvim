local map = vim.api.nvim_set_keymap

map('n', '<leader>a', ':Search<space>', { noremap = true })

vim.cmd [[
  fun! SearchContentAndShowFiles(...)
    if len(a:000) == 0
      echo 'No search input'
      return
    endif
    let grep_command = 'grep --ignore-case --exclude-dir={.git,node_modules,Pods,coverage,docs,obj} --fixed-strings --files-with-matches --null --recursive'
    let error_file = tempname()
    let pattern = substitute(join(a:000, ' '), "\"", '\\\"', "g")
    let search = "\"" . pattern . "\""
    silent exe '!' . grep_command . " " . search . " . | xargs -0 file | sed 's/:/:1:/' > " . error_file
    set errorformat=%f:%l:%m
    exe "cg " . error_file
    botright cope
    call delete(error_file)
    redraw!
    echo 'Search results for "' . pattern . '"'
  endf

  command! -nargs=* Search call SearchContentAndShowFiles(<f-args>)
]]
