filetype off

" -----------------------
" Vim Plug
" -----------------------
call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter' " Git gutter
Plug 'tpope/vim-fugitive'     " Git in vim

Plug 'janko-m/vim-test'       " Run tests

Plug 'tpope/vim-dispatch'     " Async tasks

Plug 'Shougo/deoplete.nvim'   " completion
Plug 'Shougo/neosnippet.vim'  " snipets
Plug 'Shougo/neosnippet-snippets'

Plug 'jiangmiao/auto-pairs'   " Pair brackets etc
Plug 'tpope/vim-endwise'      " Pair do .. end

Plug 'tpope/vim-commentary'   " Comment things easily
Plug 'tpope/vim-surround'     " Should be built in

Plug 'AndrewRadev/splitjoin.vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install'  } | Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-grepper'                           " Async grepprg
Plug 'romainl/vim-qf'                              " Tame quickfix

Plug 'benekastah/neomake'     " Make checkers

Plug 'vim-ruby/vim-ruby'      " Languages
Plug 'pangloss/vim-javascript'
Plug 'elixir-lang/vim-elixir'
Plug 'https://github.com/archSeer/elixir.nvim.git'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'elmcast/elm-vim'

Plug 'tpope/vim-unimpaired'   " Pairs of useful keybinds

Plug 'unblevable/quick-scope' " f/t/F/T on steroids

Plug 'tomasr/molokai'         " colors

Plug 'kana/vim-textobj-user'  " some nice text objects
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

"
" == Key Bindings ==
"
let mapleader = ' '
let g:mapleader = ' '

" -- vimrc
nnoremap <leader>R :so ~/.config/nvim/init.vim<CR>

" -- splits
map <Leader>sh :split<CR>
map <Leader>sv :vsp<CR>

" -- windows SPC-w
map <Leader>wc :close<CR>
map <Leader>wac :only<CR>
map <Leader>wpc :pc<CR>

" -- tabs   SPC-t
map <C-t> :tabnew<CR>
map <Leader>tc :tabclose<CR>
nnoremap ]t gt
nnoremap [t gT

" -- buffers SPC-b
map <Leader>bd :bd<CR>
map <Leader>bad :bufdo bd<CR>


" -- Location list SPC-l
map <Leader>lo :lopen<CR>
map <Leader>lc :lcl<CR>


" -- FZF SPC-f
let g:fzf_command_prefix = 'Fzf'
nnoremap <C-p> :FzfFiles<CR>
nnoremap <Leader>f<Tab> :FzfBuffers<CR>
nnoremap <Leader>fb :FzfBTags<CR>
nnoremap <Leader>ft :FzfTags<CR>
nnoremap <Leader>fa :FzfAg<CR>

" -- Grep SPC-g
let g:grepper = {
  \ 'quickfix': 1,
  \ 'open': 1,
  \ 'switch': 1,
  \ 'jump': 0,
  \ 'tools': ['ag'],
  \ }

if executable('ag')
  " Integrate with Ag
  set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column\ --vimgrep
  set grepformat=%f:%l:%c:%m,%f:%l:%m

  nmap gs  <plug>(GrepperOperator)
  xmap gs  <plug>(GrepperOperator)

  noremap <Leader>gs :Grepper! -noswitch -tool ag -query '\b<C-r><C-w>\b'<CR>
  nnoremap <Leader>gg :Grepper! -tool ag -query ''<Left>
  command! -nargs=* Ag Grepper -tool ag -query <args>
  command! Grep Grepper! -tool ag
  command! GRep Grep
endif

" --  Tests SPC-t
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tt :TestFile<CR>
nmap <silent> <leader>ta :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>
let test#strategy = "dispatch"
let test#ruby#rspec#options = '--format progress'

" -- Yank/Paste SPC-y SPC-p
nmap <Leader>yg "*y
nmap <Leader>pg "*p
nmap Y y$

" file path in ex mode
cnoremap <expr> %% expand('%:h').'/'

" shift is hard sometimes
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

" <TAB>: completion
let g:deoplete#enable_at_startup = 1
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" Close popup by <Space>
inoremap <expr><Space> pumvisible() ? deoplete#mappings#close_popup() : "\<Space>"


map <Leader>d :Dispatch<CR>

nnoremap <Leader>tw :StripWhitespace<CR>


map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
imap ;; <esc>

" --  General
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
set completeopt-=preview
set mouse -=a
set splitbelow
set smarttab
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
noremap h <nop>
noremap l <nop>

" -- Neomake
autocmd! BufWritePost * Neomake
let g:neomake_javascript_jshint_maker = {
    \ 'args': ['--esnext'],
    \ }

" -- Colours
set background=dark
colorscheme molokai
highlight LineNr ctermbg=NONE
let g:gitgutter_override_sign_column_highlight = 0
highlight SignColumn ctermbg=NONE

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']


" -- Statusline
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

" -- Local vimrc
if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif
