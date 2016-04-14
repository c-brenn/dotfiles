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
