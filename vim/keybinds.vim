command! Reload
      \ exec 'source ' ConfigFilePath("vimrc") |
      \ if exists(':AirlineRefresh') |AirlineRefresh |endif
" easy esc
inoremap jk <Esc>
inoremap JK <Esc>
inoremap Jk <Esc>
inoremap jK <Esc>

if has('nvim')
  tnoremap jk <C-\><C-n>
  tnoremap JK <C-\><C-n>
  tnoremap Jk <C-\><C-n>
  tnoremap jK <C-\><C-n>
end

map Y y$

nnoremap Q <NOP>
command! Wq wq
command! WQ wq
command! W w
command! Q q
