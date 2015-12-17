filetype off

" -----------------------
" Vim Plug
" -----------------------
call plug#begin('~/.vim/plugged')
" -- GIT --
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" -- Tests --
Plug 'janko-m/vim-test'
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'

" -- COMPLETION --
Plug 'Shougo/deoplete.nvim'
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
Plug 'ntpeters/vim-better-whitespace'

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
map <Leader>lo :lopen<CR>
map <Leader>lc :lcl<CR>

" Errors
autocmd! BufWritePost * Neomake

let g:neomake_javascript_jshint_maker = {
    \ 'args': ['--esnext'],
    \ }

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
map <Leader>ot :15sp<CR>:terminal<CR>

" Elixir
nnoremap <Leader>ee V:ElixirExec<CR>
xnoremap <Leader>ee :ElixirExec<CR>

nnoremap ; :

" Completion

let g:deoplete#enable_at_startup = 1
" <TAB>: completion
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Close popup by <Space>
inoremap <expr><Space> pumvisible() ? deoplete#mappings#close_popup() : "\<Space>"

" ---------------------------
"  Tests
"  --------------------------
let test#strategy = "dispatch"
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tt :TestFile<CR>
nmap <silent> <leader>ta :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>
let test#ruby#rspec#options = '--format progress'

map <Leader>d :Dispatch<CR>

nnoremap <Leader>tw :StripWhitespace<CR>

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
set splitbelow
set list listchars=tab:▸\ ,trail:·,nbsp:·,eol:¬
set smarttab
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
noremap h <nop>
noremap l <nop>

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
function! S_modified()
  if !&modifiable || &readonly
    return ' '.emoji#for('lock').' '
  elseif &modified
    return ' '.emoji#for('pencil').' '
  else
    return ''
  endif
endfunction

function! S_fugitive()
  if exists('*figutive#head') && strlen(fugitive#head())
    return fugitive#head()
  else
    return ''
  endif
endfunction

set statusline=                                                            " clear upon load
set statusline+=\ %{emoji#available()?emoji#for('sparkles').'\ ':''}       " sparkles
set statusline+=\ %n:\ %f                                                  " buffer + filename
set statusline+=%{S_modified()}                                            " modification
set statusline+=%{strlen(&filetype)?'\ ['.&filetype.']\ ':''}              " file info
set statusline+=%{S_fugitive()}                                            " git
set statusline+=%=%-30.(line:\ %l\ of\ %L,\ col:\ %c%V%)                   " position
set statusline+=\ %P\                                                      " percent
set statusline+=\ %{emoji#available()?emoji#for('sparkles').'\ ':''}       " sparkles
" -----------------------
" LOCAL VIMRC
" -----------------------

if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif
