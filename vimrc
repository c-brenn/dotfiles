filetype off
runtime macros/matchit.vim

if has('nvim')
  let g:plugin_path='~/.config/nvim/plugged'
else
  set nocompatible
  let g:plugin_path='~/.vim/plugged'
endif

call plug#begin(g:plugin_path)
" GIT
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Editing
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'AndrewRadev/splitjoin.vim'

" Handy keybindings
Plug 'tpope/vim-unimpaired'

Plug 'junegunn/vim-slash'

" Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Async jobs
Plug 'janko-m/vim-test'
Plug 'benekastah/neomake'

" Movement
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install'  } | Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'

" Language support
Plug 'elixir-lang/vim-elixir',  { 'for': ['elixir', 'eelixir'] }
Plug 'slashmili/alchemist.vim', { 'for': ['elixir', 'eelixir'] }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'tpope/vim-markdown',      { 'for': 'markdown' }
Plug 'tmux-plugins/vim-tmux',   { 'for': 'tmux' }
Plug 'hdima/python-syntax',     { 'for': 'python' }
Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile'}

" Aesthetics
Plug 'ayu-theme/ayu-vim'
Plug 'ntpeters/vim-better-whitespace'
call plug#end()

syntax on
filetype plugin indent on

set hidden
set nocursorline
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

set scrolloff=20
set sidescrolloff=20

set tags+=./.tags

set listchars=tab:»\ ,extends:›
set showbreak=›››
set list

set wildmenu
set wildmode=longest:full,full
set wildignore=*.o,*.obj,*~,*.pyc,*.so,*.swp,tmp/
set wildignore+=*.pdf,*.jpg,*.dmg,*.zip,*.png,*.gif,*DS_Store*

set complete+=kspell
set completeopt=menu,menuone

set showcmd

set diffopt=vertical

set switchbuf=useopen

set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1

let ayucolor="mirage"
colorscheme ayu

function! ReadOnly()
  if &readonly || !&modifiable
    return ' '
  else
    return ''
endfunction

function! GitInfo()
  let git = fugitive#head()
  if git != ''
    return ' '.fugitive#head()
  else
    return ''
endfunction

set laststatus=2
set statusline=
set statusline+=%1*\ [%n]
set statusline+=%2*\ %f
set statusline+=%3*\ %{ReadOnly()}
set statusline+=%4*\ %m
set statusline+=%1*\ %{GitInfo()}
set statusline+=%0*\ %=
set statusline+=%1*\ %y
set statusline+=\ %5*\ %3p%%\ \ %l:\ %3c

highlight VertSplit guibg=#212732 guifg=white
highlight StatusLine guibg=#212732
highlight StatusLineNC guibg=#212732
highlight User1 guibg=#212732 guifg=#95e6cb
highlight User2 guibg=#212732 guifg=#ffcc66
highlight User3 guibg=#212732 guifg=#95e6cb
highlight User4 guibg=#212732 guifg=#95e6cb
highlight User5 guibg=#3e4b59 guifg=white

" Functions
function! RenameCurrentFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

function! TestStrategy(cmd) abort
  let opts = {'suffix': ' # vim-test'}

  function! opts.close_terminal()
    if bufnr(self.suffix) != -1
      execute 'bdelete!' bufnr(self.suffix)
    end
  endfunction
  call opts.close_terminal()

  function! opts.on_exit(job_id, exit_code)
    if a:exit_code == 0
      call self.close_terminal()
    endif
  endfunction

  let last_buffer = getreg("#")

  let command = a:cmd . opts.suffix
  vsplit +call\ termopen(command,opts) new
  wincmd p

  call setreg("#", last_buffer)
endfunction

" Keybinds
let mapleader="\<Space>"

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

map <C-h>  <C-w>h
map <C-j>  <C-w>j
map <C-k>  <C-w>k
map <C-l>  <C-w>l

map Y y$
nnoremap Q <NOP>

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

let g:fzf_command_prefix = 'Fzf'
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_colors =
\ { 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Identifier'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)

" Buffers
nnoremap <leader>bb :FzfBuffers<cr>
nnoremap <leader>bd :bd!<cr>

" Commands
nnoremap <leader>cc :FzfCommands<cr>

" Git
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gm :FzfGFiles?<cr>

" Help
nnoremap <leader>hh :FzfHelptags<cr>

" Files
nnoremap <leader>ff :FzfFiles<cr>
nnoremap <leader>fs :update<cr>
nnoremap <leader>fr :call RenameCurrentFile()<cr>
nnoremap <leader>fr :call RenameCurrentFile()<cr>

" Search
nnoremap <leader>s/ :Rg<cr>
nnoremap <leader>ss :FzfLines<cr>
nnoremap <leader>sb :FzfBLines<cr>

" Tests
nnoremap <leader>tt :TestNearest<CR>
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>ta :TestSuite<CR>
nnoremap <leader>tl :TestLast<CR>
nnoremap <leader>tg :TestVisit<CR>

nnoremap <leader>xw :StripWhitespace<cr>

" Plugin Config
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

let g:test#custom_strategies = {'mine': function('TestStrategy')}
let g:test#strategy = 'mine'

if has('nvim')
  set inccommand=nosplit
  tnoremap <Esc> <C-\><C-n>

  augroup Neomake
    autocmd!
    autocmd BufWritePost * Neomake
    autocmd BufReadPost  * Neomake
  augroup END
endif

let g:neomake_highlight_lines=1
highlight link NeomakeError SpellBad

" Commands
command! -bar Reload exec 'source ~/dotfiles/vimrc'
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
