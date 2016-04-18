command! Reload
      \ exec 'source ' ConfigFilePath("vimrc") |
      \ if exists(':AirlineRefresh') |AirlineRefresh |endif
" Navigate EX commands easily
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
"Navigate windows easily
map <C-h>  <C-w>h
map <C-j>  <C-w>j
map <C-k>  <C-w>k
map <C-l>  <C-w>l

map Y y$

nnoremap Q <NOP>
command! Wq wq
command! WQ wq
command! W w
command! Q q
