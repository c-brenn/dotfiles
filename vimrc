filetype off

" -----------------------
" Vim Plug
" -----------------------
call plug#begin('~/.vim/plugged')
if executable('tmux')
  " -- TMUX --
  Plug 'benmills/vimux'
endif

" -- GIT --
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" -- Tests --
Plug 'janko-m/vim-test'
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'

" -- COMPLETION --
Plug 'ajh17/VimCompletesMe'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" -- MOVING THINGS --
Plug 'AndrewRadev/splitjoin.vim'

" -- MAGICAL SEARCH --
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install'  } | Plug 'junegunn/fzf.vim'

" -- SYNTAX --
Plug 'benekastah/neomake'
Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'
Plug 'cakebaker/scss-syntax.vim'
Plug 'vim-scripts/haskell.vim'
Plug 'c-brenn/vim-elixir', { 'branch': 'nvim-rplugin' }
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'

" -- NAVIGATION --
Plug 'tpope/vim-unimpaired'
Plug 'unblevable/quick-scope'

" -- COLOURS --
Plug 'tomasr/molokai'

" -- TEXT OBJECTS --
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'

" -- MISC --
Plug 'tpope/vim-vinegar'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-sensible'
Plug 'junegunn/vim-emoji'

call plug#end()

filetype plugin indent on
runtime macros/matchit.vim

" -----------------------
" KEY BINDINGS
" -----------------------

let mapleader = ' '
let g:mapleader = ' '

" Tabs/Windows
map <Leader>sp :split %<CR>
map <Leader>vp :vsp %<CR>
map <C-t> :tabnew<CR>
map <Leader>tc :tabclose<CR>
map <Leader>bd :bd<CR>
map <Leader>pc :pc<CR>

" Errors
autocmd! BufWritePost * Neomake
let g:neomake_open_list = 2

map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
imap ;; <esc>

nnoremap <leader>R :so ~/.config/nvim/init.vim<CR>

" FZF
let g:fzf_command_prefix = 'Fzf'
nnoremap <C-p> :FzfFiles<CR>
nnoremap <Leader><Tab> :FzfBuffers<CR>
nnoremap <Leader>fb :FzfBTags<CR>
nnoremap <Leader>ft :FzfTags<CR>

cnoremap <expr> %% expand('%:h').'/'

command! Q q
command! Qall qall
command! QA qall
command! E e

" Terminal Mode
tnoremap <Esc> <C-\><C-n>
map <Leader>ot :terminal<CR>

" Elixir
nnoremap <Leader>ee V:ElixirExec<CR>
xnoremap <Leader>ee :ElixirExec<CR>


" ---------------------------
"  Tests
"  --------------------------
let test#strategy = "dispatch"
nmap <silent> <leader>tT :TestNearest<CR>
nmap <silent> <leader>tt :TestFile<CR>
nmap <silent> <leader>ta :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>
let test#ruby#rspec#options = '--format progress'

map <Leader>d :Dispatch<CR>

nnoremap <Leader>tw :call TrimWhitespace()<CR>
au BufWritePre *.rb :call TrimWhitespace()
function! TrimWhitespace()
  %s/\s\+$//e
endfunc

" -----------------------
"  GENERAL
" -----------------------
syntax on
set relativenumber
set hidden
set scrolloff=10
set sidescrolloff=10"
set backupdir=~/.tmp
set directory=~/.tmp
set expandtab
set smartcase
set ignorecase
set timeoutlen=500
set completefunc=emoji#complete
set mouse -=a

augroup FileTypeSettings
  autocmd!
  autocmd BufNewFile,BufRead *.html.erb setlocal filetype=html
  autocmd FileType html setlocal ts=2 sw=2 sts=2 expandtab
  autocmd FileType ruby setlocal ts=2 sw=2 expandtab
  autocmd FileType vim setlocal ts=2 sw=2 expandtab keywordprg=:help
  autocmd FileType haskell setlocal ts=2 sw=2 expandtab
  autocmd FileType python setlocal ts=4 sw=4 expandtab
  autocmd FileType javascript setlocal ts=2 sw=2 expandtab
  autocmd FileType coffee setlocal ts=2 sw=2 expandtab
  autocmd FileType sh,zsh setlocal ts=2 sw=2 expandtab
  autocmd BufNewFile,BufRead *.md set filetype=markdown
  autocmd BufNewFile,BufRead *.css set filetype=scss
  autocmd FileType markdown setlocal spell textwidth=80
  autocmd FileType gitcommit setlocal spell
  autocmd FileType text setlocal spell
  autocmd FileType scss setlocal ts=2 sw=2 expandtab
augroup END

" -----------------------
" COLOURS
" -----------------------

set background=dark
colorscheme molokai
highlight LineNr ctermbg=NONE
let g:gitgutter_override_sign_column_highlight = 0
highlight SignColumn ctermbg=NONE

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']


" -----------------------
" Statusline
" -----------------------
set statusline=%<[%n]\ %F\ %m%r%y\ %{exists('g:loaded_fugitive')?fugitive#statusline():''}\ %=%-14.(%l,%c%V%)\ %P

" -----------------------
" LOCAL VIMRC
" -----------------------

if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif
