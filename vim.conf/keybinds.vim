" set a map leader for more key combos
let mapleader = ' '
let g:mapleader = ' '

" Source vimrc
nnoremap <leader>R :so ~/.vimrc<CR>:AirlineRefresh<CR>

" Fuzzy search
nnoremap <silent> <C-p> :FZF --color=light,fg:232,bg:255,bg+:116,info:27<CR>

" Does exactly what it says on the tin
nnoremap <Leader>tw :call TrimWhitespace()<CR>

" Run current file specs in tmux
if exists('$TMUX')
  nnoremap <Leader>vr :RunRailsFocusedTest<CR>
  nnoremap <Leader>vc :RunRubyFocusedContext<CR>
  nnoremap <Leader>vx :VimuxCloseRunner<CR>
end

autocmd FileType ruby nmap <buffer> <leader>l <Plug>(xmpfilter-mark)
autocmd FileType ruby xmap <buffer> <leader>l <Plug>(xmpfilter-mark)
autocmd FileType ruby imap <buffer> <leader>l <Plug>(xmpfilter-mark)

autocmd FileType ruby nmap <buffer> <leader>L <Plug>(xmpfilter-run)
autocmd FileType ruby xmap <buffer> <leader>L <Plug>(xmpfilter-run)
autocmd FileType ruby imap <buffer> <leader>L <Plug>(xmpfilter-run)

function! SourceVimrc()
  exec "so ~/.vimrc"
  exec "AirlineRefresh"
endfunction

function! TrimWhitespace()
  %s/\s\+$//e
endfunc
