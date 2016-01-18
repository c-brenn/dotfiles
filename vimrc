filetype off

" -----------------------
" Vim Plug
" -----------------------
call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter' " Git gutter
Plug 'tpope/vim-fugitive'     " Git in vim

Plug 'tpope/vim-dispatch'     " Async tasks
Plug 'kassio/neoterm'         " send tasks to terminal

Plug 'ajh17/VimCompletesMe'

Plug 'jiangmiao/auto-pairs'   " Pair brackets etc
Plug 'tpope/vim-endwise'      " Pair do .. end

Plug 'tpope/vim-commentary'   " Comment things easily
Plug 'tpope/vim-surround'     " Should be built in

Plug 'AndrewRadev/splitjoin.vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install'  } | Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-grepper'                           " Async grepprg
Plug 'romainl/vim-qf'                              " Tame quickfix
Plug 'godlygeek/tabular'      " arrange things

Plug 'c-brenn/neomake', { 'branch': 'elm-maker' }     " Make checkers

Plug 'vim-ruby/vim-ruby',       { 'for': 'ruby' }
Plug 'tpope/vim-rails',         { 'for': 'ruby' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript'}
Plug 'elixir-lang/vim-elixir'
Plug 'awetzel/elixir.nvim',     { 'for': 'elixir', 'do': './install.sh' }
Plug 'c-brenn/vim-phoenix'
Plug 'elmcast/elm-vim',         { 'for': 'elm' }
Plug 'neovimhaskell/haskell-vim'
Plug 'junegunn/vim-xmark', { 'do': 'make' }

Plug 'tpope/vim-unimpaired'   " Pairs of useful keybinds

Plug 'unblevable/quick-scope' " f/t/F/T on steroids

Plug 'morhetz/gruvbox'         " colors

Plug 'kana/vim-textobj-user'  " some nice text objects
Plug 'kana/vim-textobj-entire'

Plug 'tpope/vim-projectionist'

" -- MISC --
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-sensible'
Plug 'junegunn/vim-emoji'
Plug 'ntpeters/vim-better-whitespace'

" -- WIP
Plug 'c-brenn/fzf-projectionist.vim'

Plug 'easymotion/vim-easymotion'
call plug#end()

filetype plugin indent on
runtime macros/matchit.vim

"
" == Key Bindings ==
"
let mapleader = ' '
let g:mapleader = ' '

" -- General
" easy esc
inoremap jk <Esc>
inoremap JK <Esc>
inoremap Jk <Esc>
inoremap jK <Esc>

tnoremap jk <C-\><C-n>
tnoremap JK <C-\><C-n>
tnoremap Jk <C-\><C-n>
tnoremap jK <C-\><C-n>

" easy EX mode
nnoremap ; :
vnoremap ; :

" save ; motion
nnoremap , ;
vnoremap , ;
nnoremap <S-,> ,
vnoremap <S-,> ,

let g:fzf_command_prefix = 'Fzf'

" -- Files SPC-f
nnoremap <Leader>fr :call RenameFile()<cr>
nnoremap <Leader>ff :FzfFiles<CR>

" -- Windows SPC-w
nnoremap <Leader>wh :split<CR>
nnoremap <Leader>wv :vsp<CR>
nnoremap <Leader>wc :close<CR>
nnoremap <Leader>wo :only<CR>
nnoremap <Leader>wlo :lopen<CR>
nnoremap <Leader>wlc :lcl<CR>
nnoremap <Leader>wqo :Copen<CR>
nnoremap <Leader>wql :ccl<CR>

" -- buffers SPC-b
nnoremap <Leader>bb :FzfBuffers<CR>
nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>bo :bufdo bd<CR>

" -- vimrc
nnoremap <leader>rr :so ~/.config/nvim/init.vim<CR>

" -- tabs   SPC-t
map <C-t> :tabnew<CR>
nnoremap <Leader>tc :tabclose<CR>
nnoremap <Leader>to :tabonly<CR>


function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

" Behaviour that differs based on filetype/project
" SPC-m
" --- alternates SPC-ma
nnoremap <Leader>maa :A<CR>
nnoremap <Leader>mav :AV<CR>
nnoremap <Leader>mat :AT<CR>
" --- fzf{type} SPC-mf
nnoremap <Leader>mfm :FZFmodel<CR>
nnoremap <Leader>mfc :FZFcontroller<CR>
nnoremap <Leader>mfv :FZFview<CR>
nnoremap <Leader>mfh :FZFchannel<CR>
" --- repl SPC-mr
nnoremap <Leader>mrr :Console<CR>
nnoremap <Leader>mrs :Start<CR>
" -- build tool SPC-mb
nnoremap <Leader>mb  :<C-R>=M_BuildTool()<CR>
function! M_BuildTool()
  if &filetype == 'ruby'
    return 'Bundle '
  else
    return 'Mix '
  endif
endfunction

" --- tests SPC-mt
let test#strategy = "neoterm"
let g:neoterm_run_tests_bg=1
let g:neoterm_raise_when_tests_fail=1
let g:neoterm_close_when_tests_succeed=1
let g:neoterm_test_status = {
  \ 'running' : emoji#for('running'),
  \ 'success' : emoji#for('tada'),
  \ 'failed'  : emoji#for('fire')
  \ }
nmap <silent> <leader>mtt :call neoterm#test#run('file')<CR>
nmap <silent> <leader>mtn :call neoterm#test#run('current')<CR>
nmap <silent> <leader>mta :call neoterm#test#run('all')<CR>
nmap <silent> <leader>mtl :call neoterm#test#rerun()<CR>

" -- shell SPC-s
nnoremap <leader>sn :Tnew<CR>
nnoremap <leader>ss :call M_send_command()<CR>
nnoremap <leader>sl :call M_send_last_command()<CR>
nnoremap <leader>sc :Tclose<CR>
nnoremap <leader>so :Topen<CR>
function! M_send_command() abort
  call inputsave()
  let g:m_last_command = input('Enter command: ')
  call inputrestore()
  exe 'T ' . g:m_last_command
endfunction
function! M_send_last_command() abort
  if exists('g:m_last_command') && g:m_last_command != ''
    exe 'T ' . g:m_last_command
  endif
endfunction
let g:neoterm_size=15

" -- Text Manipulation SPC-x
nnoremap <Leader>xw :StripWhitespace<CR>


" -- Git SPC-g
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gb :Gblame<CR>


" -- Grep SPC-/
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

  noremap <Leader>/s :Grepper -noswitch -tool ag -query '\b<C-r><C-w>\b'<CR>
  nnoremap <Leader>// :Grepper -tool ag -query ''<Left>
  command! -nargs=* Ag Grepper -tool ag -query <args>
  command! Grep Grepper -tool ag
  command! GRep Grep
endif

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

nnoremap <Leader>d :Dispatch<Space>

map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

" --  General
syntax on
set number
set hidden
set scrolloff=10
set sidescrolloff=10"
set backupdir=~/.tmp
set directory=~/.tmp
set expandtab
set smartcase
set ignorecase
set notimeout
set ttimeout
set completeopt-=preview
set mouse -=a
set splitbelow
set smarttab
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set showcmd

" -- Elixir
let g:elixir_autobuild = 0

" -- Neomake
autocmd! BufWritePost * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_ruby_enabled_makers = ['rubocop']

" -- Filetype settings
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
  autocmd BufNewFile,BufRead *.md set filetype=markdown
  autocmd BufNewFile,BufRead *.css set filetype=scss
  autocmd FileType markdown setlocal spell textwidth=80
  autocmd FileType gitcommit setlocal spell
  autocmd FileType text setlocal spell
  autocmd FileType scss setlocal ts=2 sw=2 expandtab
  autocmd FileType qf setlocal wrap linebreak
augroup END

" -- Colours
set background=dark
colorscheme gruvbox

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

source ~/dotfiles/vim/appearance.vim
" -- Local vimrc
if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif
