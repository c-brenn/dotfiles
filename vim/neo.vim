if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  augroup Terminal
    au WinEnter term://* startinsert
  augroup END


  augroup Neomake
    autocmd!
    autocmd BufWritePost *.rb Neomake
    autocmd BufWritePost *.rs Neomake
    autocmd BufWritePost *.ex Neomake
    autocmd BufWritePost *.hs Neomake
    autocmd FileType elixir
      \ if filereadable(findfile("mix.exs", escape('%:p:h', ' ').';')) |
      \   let g:neomake_elixir_enabled_makers = ['mix'] |
      \ else |
      \   let g:neomake_elixir_enabled_makers = ['elixir'] |
      \ endif
  augroup END

  let g:neomake_open_list = 2
  let g:neomake_elixir_mix_maker = {
    \ 'exe': 'mix',
    \ 'errorformat': '%E** %*[^\ ] %f:%l: %m,%W%f:%l: warning: %m',
    \ 'args': ['compile', '%:p']
    \ }

  let g:neomake_error_sign = { 'text' : 'E' }
  let g:neomake_warning_sign = { 'text' : 'W' }
  let g:neomake_message_sign = { 'text' : 'M' }
  let g:neomake_informational_sign = { 'text' : 'i' }
endif
