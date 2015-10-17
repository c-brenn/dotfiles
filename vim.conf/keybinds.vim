" set a map leader for more key combos
let mapleader = ','
let g:mapleader = ','

" cycle through buffers
map <Leader><tab> :bn<CR>
map <Leader>` :bp<CR>
map ` :EasyBuffer<CR>"

nnoremap <leader>R :so ~/.vimrc<CR>:AirlineRefresh<CR>

nnoremap <silent> <C-p> :FZF --color=light,fg:232,bg:255,bg+:116,info:27<CR>

nnoremap <Leader>tw :call TrimWhitespace()<CR>
"
function! SourceVimrc()
  exec "so ~/.vimrc"
  exec "AirlineRefresh"
endfunction

function! TrimWhitespace()
  %s/\s\+$//e
endfunc
