filetype off

" -----------------------
" Vim Plug
" -----------------------
call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter' " Git gutter
Plug 'tpope/vim-fugitive'     " Git in vim

Plug 'janko-m/vim-test'       " Run tests

Plug 'tpope/vim-dispatch'     " Async tasks

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

Plug 'benekastah/neomake'     " Make checkers

Plug 'vim-ruby/vim-ruby',       { 'for': 'ruby' }
Plug 'tpope/vim-rails',         { 'for': 'ruby' }
Plug 'tpope/vim-bundler',       { 'for': 'ruby' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript'}
Plug 'elixir-lang/vim-elixir',  { 'for': 'elixir' }
Plug 'awetzel/elixir.nvim',     { 'for': 'elixir', 'do': './install.sh' }
Plug 'c-brenn/vim-phoenix'
Plug 'elmcast/elm-vim',         { 'for': 'elm' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

Plug 'tpope/vim-unimpaired'   " Pairs of useful keybinds

Plug 'unblevable/quick-scope' " f/t/F/T on steroids

Plug 'morhetz/gruvbox'         " colors

Plug 'kana/vim-textobj-user'  " some nice text objects
Plug 'kana/vim-textobj-entire'

Plug 'tpope/vim-projectionist' " project navigation

" -- MISC --
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-sensible'
Plug 'junegunn/vim-emoji'
Plug 'ntpeters/vim-better-whitespace'
Plug 'thinca/vim-ref'

call plug#end()

filetype plugin indent on
runtime macros/matchit.vim

"
" == Key Bindings ==
"
let mapleader = ' '
let g:mapleader = ' '

" -- FZF SPC-f
let g:fzf_command_prefix = 'Fzf'
nnoremap <Leader>ff :FzfFiles<CR>
nnoremap <Leader>fb :FzfBTags<CR>
nnoremap <Leader>ft :FzfTags<CR>
nnoremap <Leader>fa :FzfAg<CR>

" -- vimrc
nnoremap <leader>rr :so ~/.config/nvim/init.vim<CR>

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
map <Leader>tac :tabonly<CR>

" -- buffers SPC-b
map <Leader>bb :FzfBuffers<CR>
map <Leader>bd :bd<CR>
map <Leader>bad :bufdo bd<CR>
map <Leader>brn :call RenameFile()<cr>

function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

" -- project navigation SPC-p
map <Leader>paa :A<CR>
map <Leader>pas :AS<CR>
map <Leader>pav :AV<CR>
map <Leader>pat :AT<CR>
" rails/phoenix
map <Leader>pec :Econtroller<Space>
map <Leader>pem :Emodel<Space>
map <Leader>pev :Eview<Space>
map <Leader>pet :Etest<Space>

" -- Location list SPC-l
map <Leader>lo :lopen<CR>
map <Leader>lc :lcl<CR>

" -- Quickfix list SPC-c
map <Leader>co :Copen<CR>
map <Leader>cl :ccl<CR>


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
let g:elixir_autobuild = 1

" <TAB>: completion
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

map <Leader>d :Dispatch

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
" noremap h <nop>
" noremap l <nop>

" -- Neomake
autocmd! BufWritePost * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']

" -- Colours
set background=dark
colorscheme gruvbox

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
set statusline+=%1*
set statusline+=\ %{emoji#available()?emoji#for('sparkles').'\ ':''}       " sparkles
set statusline+=%2*
set statusline+=\ %n:\ %f                                                  " buffer + filename
set statusline+=%{S_modified()}                                            " modification
set statusline+=%3*
set statusline+=%{strlen(&filetype)?'\ ['.&filetype.']\ ':''}              " file info
set statusline+=%2*
set statusline+=%{S_fugitive()}                                            " git
set statusline+=%=%-30.(line:\ %l\ of\ %L,\ col:\ %c%V%)                   " position
set statusline+=%3*
set statusline+=\ %P\                                                      " percent
set statusline+=\ %{emoji#available()?emoji#for('sparkles').'\ ':''}       " sparkles

highlight User1 ctermfg=110 ctermbg=236 guifg=#83a598 guibg=#282828
highlight User2 ctermfg=203 ctermbg=236 guibg=#282828 guifg=#fb4934
highlight User3 ctermfg=213 ctermbg=236 guibg=#282828 guifg=#d3869b
highlight User4 guibg=#282828 guifg=#fe8019

highlight SignColumn ctermbg=black guibg=#1d2021
highlight lineNr ctermbg=black guibg=#1d2021
highlight GitGutterAdd ctermbg=black guibg=#1d2021 guifg=#b8bb26
highlight GitGutterChange ctermbg=black guibg=#1d2021 guifg=#83a598
highlight GitGutterDelete ctermbg=black guibg=#1d2021 guifg=#fb4934
highlight GitGutterChangeDelete ctermbg=black guibg=#1d2021 guifg=#fe8019
highlight ModeMsg ctermfg=213 guifg=#b8bb26

" -- Local vimrc
if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif
