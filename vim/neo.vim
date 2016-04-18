if has('nvim')
  tnoremap <Esc> <C-\><C-n>


  augroup Neomake
    autocmd!
    autocmd BufWritePost *.rb Neomake
    autocmd BufWritePost *.rs Neomake
    autocmd BufWritePost *.ex Neomake
    autocmd BufWritePost *.hs Neomake
  augroup END

  let g:neomake_open_list = 2
endif
