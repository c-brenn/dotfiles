" set a map leader for more key combos
let mapleader = ','
let g:mapleader = ','

" Quick Esc
inoremap ;; <Esc>:noh<CR>

" cycle through buffers
map <Leader><tab> :bn<CR>
map <Leader>` :bp<CR>
map ` :EasyBuffer<CR>"

nnoremap <leader>R :so ~/.vimrc<CR>:AirlineRefresh<CR>
nnoremap <C-p> :FZF<CR>

" Textmate style indentation
vmap <leader>[ <gv
vmap <leader> ] >gv
nmap <leader>[ <<
nmap <leader>] >>
nnoremap <Leader>tw :call TrimWhitespace()<CR>
"
function! SourceVimrc()
  exec "so ~/.vimrc"
  exec "AirlineRefresh"
endfunction

function! TrimWhitespace()
  %s/\s\+$//e
endfunc
