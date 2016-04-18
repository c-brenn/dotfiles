" Files
nnoremap <leader>ff :FzfFiles<cr>
nnoremap <leader>fs :w<cr>
nnoremap <leader>fr :call RenameCurrentFile()<cr>

" Buffers
nnoremap <leader>bb :FzfBuffers<cr>

" Tests
if has('nvim')
  nnoremap <leader>tn :call neoterm#test#run('current')<cr>
  nnoremap <leader>tt :call neoterm#test#run('file')<cr>
  nnoremap <leader>ta :call neoterm#test#run('all')<cr>
  nnoremap <leader>tl :call neoterm#test#rerun()<cr>
  let g:neoterm_close_when_tests_succeed = 1
endif

" Text
nnoremap <leader>xw :call TrimWhiteSpace()<cr>

" Repl/Shell
nnoremap <leader>ro :Ropen<cr>
nnoremap <expr> <leader>rd ":Rdo ".GetInput("Repl","")."\<CR>"
nnoremap <leader>rs :Rshow<cr>
nnoremap <leader>rh :Rhide<cr>
nnoremap <leader>rc :Rclear<cr>
nnoremap <leader>rl :Rload<cr>

nnoremap <leader>so :Sopen<cr>
nnoremap <expr> <leader>sd ":Sdo ".GetInput("Shell","shellcmd")."\<CR>"
nnoremap <leader>ss :Sshow<cr>
nnoremap <leader>sh :Shide<cr>
nnoremap <leader>sc :Sclear<cr>

function! GetInput(type, completion)
  if !empty(a:completion)
    return input(a:type . " command: ", "", a:completion)
  else
    return input(a:type . " command: ")
  endif
endfunction
