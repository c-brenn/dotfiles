if has('nvim')
  tnoremap <Esc> <C-\><C-n>

  augroup Neomake
      autocmd!
      autocmd BufWritePost *.rb Neomake
      autocmd BufWritePost *.rs Neomake
      autocmd BufWritePost *.ex Neomake
    augroup END
endif
