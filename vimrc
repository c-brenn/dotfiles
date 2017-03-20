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
Plug 'Shougo/deoplete.nvim'

" Async jobs
Plug 'janko-m/vim-test'
Plug 'benekastah/neomake'

" Movement
Plug 'unblevable/quick-scope'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install'  } | Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'

" Languages support
Plug 'elixir-lang/vim-elixir',   { 'for': ['elixir', 'eelixir'] }
Plug '~/Documents/vim/alchemist.vim'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'tpope/vim-markdown'

" Aesthetics
Plug 'jnurmine/Zenburn'
Plug 'itchyny/lightline.vim'
call plug#end()

syntax on
filetype plugin indent on

set clipboard=unnamed

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

set listchars=tab:»\ ,extends:›,trail:⋅
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
set background=dark
colors zenburn

highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

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

function! TrimWhiteSpace()
  let l = line('.')
  let c = col('.')
  %s/\s\+$//e
  call cursor(l, c)
endfunction

function! TestStrategy(cmd) abort
  let opts = {'suffix': ' # vim-test'}

  function! opts.close_terminal()
    if bufnr(self.suffix) != -1
      execute 'bdelete!' bufnr(self.suffix)
    end
  endfunction
  call opts.close_terminal()

  function! opts.on_exit(job_id, data)
    if a:data == 0
      call self.close_terminal()
    endif
  endfunction

  vsplit new
  call termopen(a:cmd . opts.suffix, opts)
  wincmd p
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
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)

" Buffers
nnoremap <leader>bb :FzfBuffers<cr>
nnoremap <leader>bd :bd!<cr>

" Commands
nnoremap <leader>cc :FzfCommands

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
nnoremap <leader>fc :FzfCommands<cr>
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

nnoremap <leader>xw :call TrimWhiteSpace()<cr>

" Plugin Config
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
let g:test#custom_strategies = {'mine': function('TestStrategy')}
let g:test#strategy = 'mine'
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

if has('nvim')
  set inccommand=nosplit
  tnoremap <Esc> <C-\><C-n>

  augroup Neomake
    autocmd!
    autocmd BufWritePost *.rb Neomake
    autocmd BufWritePost *.js Neomake
    autocmd BufWritePost *.ex Neomake
  augroup END
endif

" Commands
command! -bar Reload exec 'source ~/dotfiles/vimrc'
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
