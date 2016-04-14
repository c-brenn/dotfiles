command! Reload :so ~/dotfiles/vim/vimrc
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

" Move up and down visual lines, not real (but not when given a count)
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

nnoremap Q <NOP>
command! Wq wq
command! WQ wq
command! W w
command! Q q
