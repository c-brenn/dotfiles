" set a map leader for more key combos
let mapleader = ','
let g:mapleader = ','

" cycle through buffers
map <Leader><tab> :bn<CR>
map <Leader>` :bp<CR>
map ` :EasyBuffer<CR>"

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
        "
"
function! SourceVimrc()
  exec "so ~/.vimrc"
  exec "AirlineRefresh"
endfunction

function! TrimWhitespace()
  %s/\s\+$//e
endfunc
