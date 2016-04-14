if has('nvim')
  tnoremap <Esc> <C-\><C-n>


  if exists(':Neomake')
    augroup Neomake
      autocmd!
      autocmd BufWritePost *.rb Neomake
      autocmd BufWritePost *.rs Neomake
      autocmd BufWritePost *.ex Neomake
    augroup END
  endif

  let g:neomake_open_list = 2
endif
