filetype off
runtime macros/matchit.vim

if has('nvim')
  let g:plugin_path='~/.config/nvim/plugged'
else
  set nocompatible
  let g:plugin_path='~/.vim/plugged'
endif

let mapleader="\<Space>"

call plug#begin(g:plugin_path)
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

Plug 'junegunn/vim-pseudocl' | Plug 'junegunn/vim-oblique'
Plug 'junegunn/vim-easy-align'
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

Plug 'Shougo/deoplete.nvim'
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

Plug 'airblade/vim-gitgutter'
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1
set updatetime=250

" Linting/Testing
Plug 'benekastah/neomake'
let g:neomake_elixir_mix_maker = {
      \ 'exe': 'mix',
      \ 'args': ['compile'],
      \ 'cwd': getcwd(),
      \ 'errorformat':
      \ '** %s %f:%l: %m,' .
      \ '%Wwarning: %m,%Z%f:%l'
      \ }

" Searching
Plug 'unblevable/quick-scope'
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:qs_first_occurrence_highlight_color = 155
let g:qs_second_occurrence_highlight_color = 81

" Navigation
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install'  } | Plug 'junegunn/fzf.vim'
let g:fzf_command_prefix = 'Fzf'
nnoremap <leader>ff :FzfFiles<cr>
nnoremap <leader>fs :w<cr>
nnoremap <leader>fr :call RenameCurrentFile()<cr>
nnoremap <leader>b :FzfBuffers<cr>
nnoremap <leader>fc :FzfCommands<cr>
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)


Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails',          { 'for': ['ruby', 'eruby'] }
Plug 'elixir-lang/vim-elixir',   { 'for': ['elixir', 'eelixir'] }
Plug 'slashmili/alchemist.vim'
Plug 'powerman/vim-plugin-AnsiEsc' " alchemist uses this for pretty docs

Plug 'ElmCast/elm-vim'
let g:elm_setup_keybindings = 0

Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'tpope/vim-markdown'

" Haskell
Plug 'neovimhaskell/haskell-vim'
Plug 'eagletmt/neco-ghc'
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" Colours
Plug 'junegunn/seoul256.vim'
Plug 'morhetz/gruvbox'

" Repls/Shell
Plug '~/Documents/vim/repel.vim'
call plug#end()

syntax on
filetype plugin indent on

set hidden
set nocursorline
set relativenumber
set number

set shiftround
set whichwrap+=<,>,h,l

set expandtab
set smarttab
set tabstop=2
set shiftwidth=2

set autoread
set noswapfile
set nowritebackup
set nrformats-=octal

set nohlsearch
set incsearch
set ignorecase
set smartcase
set infercase

set noerrorbells
set visualbell

set tm=500
set ttimeoutlen=50

set splitright
set splitbelow

set scrolloff=10
set sidescrolloff=10

set tags+=./.tags

set listchars=tab:»\ ,extends:›,trail:⋅
set fillchars=stlnc:\-,vert:\|
set showbreak=›››
set list

set wildmenu
set wildmode=list:full,full
set wildignore=*.o,*.obj,*~,*.pyc,*.so,*.swp,tmp/
set wildignore+=*.pdf,*.jpg,*.dmg,*.zip,*.png,*.gif,*DS_Store*

set complete+=kspell
set completeopt=menu,menuone

set showcmd

set diffopt=vertical

set switchbuf=useopen

" Functions
function! Load(path)
  if filereadable(glob(a:path))
    exec "source " . a:path
  endif
endfunction

function! ConfigFilePath(file)
  return "~/dotfiles/" . a:file
endfunction

function! RenameCurrentFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

function! TrimWhiteSpace()
  let l = line('.')
  let c = col('.')
  %s/\s\+$//e
  call cursor(l, c)
endfunction

" Commands
command! -bar Reload exec 'source ' ConfigFilePath("vimrc")

" Keybinds
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

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

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

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


" Leader keybinds (non-plugin)
nnoremap <leader>xw :call TrimWhiteSpace()<cr>

" Colours
colorscheme gruvbox
set background=dark

highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

function! ReadOnly()
  if &readonly || !&modifiable
    return ''
  else
    return ''
endfunction

function! GitInfo()
  let git = fugitive#head()
  if git != ''
    return ' ['. git . ']'
  else
    return ''
endfunction

set laststatus=2

set statusline=%n:
set statusline+=%1*\ %{GitInfo()}%0*
set statusline+=%0*
set statusline+=\ %<-\ %t\ -\ %{ReadOnly()}\ %m
set statusline+=\ %#warningmsg#
set statusline+=%*
set statusline+=%=
set statusline+=%y
set statusline+=%1*%3p%%\ \ %l:\ %3c\
hi StatusLine ctermfg=236 ctermbg=66
hi User1 cterm=inverse,bold ctermfg=236 ctermbg=167
hi TabLineSel ctermbg=236 ctermfg=66

" Neovim
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
    autocmd BufWritePost *.elm ElmMake
  augroup END
endif
