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

Plug 'c-brenn/neomake', { 'branch': 'elm-maker' }     " Make checkers

Plug 'vim-ruby/vim-ruby',       { 'for': 'ruby' }
Plug 'tpope/vim-rails',         { 'for': 'ruby' }
Plug 'tpope/vim-bundler',       { 'for': 'ruby' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript'}
Plug 'elixir-lang/vim-elixir'
Plug 'awetzel/elixir.nvim',     { 'for': 'elixir', 'do': './install.sh' }
Plug 'c-brenn/vim-phoenix'
Plug 'elmcast/elm-vim',         { 'for': 'elm' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'neovimhaskell/haskell-vim'

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
Plug 'thinca/vim-ref'

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

" easy EX mode
nnoremap ; :
vnoremap ; :

" save ; motion
nnoremap , ;
vnoremap , ;
nnoremap <S-,> ,
vnoremap <S-,> ,

" -- FZF SPC-f
let g:fzf_command_prefix = 'Fzf'
nnoremap <Leader>ff :FzfFiles<CR>
nnoremap <Leader>fb :FzfBTags<CR>
nnoremap <Leader>ft :FzfTags<CR>
nnoremap <Leader>fa :FzfAg<CR>

" -- vimrc
nnoremap <leader>rr :so ~/.config/nvim/init.vim<CR>

" -- splits
nnoremap <Leader>sh :split<CR>
nnoremap <Leader>sv :vsp<CR>

" -- windows SPC-w
nnoremap <Leader>wc :close<CR>
nnoremap <Leader>wac :only<CR>
nnoremap <Leader>wpc :pc<CR>

" -- tabs   SPC-t
map <C-t> :tabnew<CR>
nnoremap <Leader>tc :tabclose<CR>
nnoremap <Leader>tac :tabonly<CR>

" -- buffers SPC-b
nnoremap <Leader>bb :FzfBuffers<CR>
nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>bad :bufdo bd<CR>
nnoremap <Leader>brn :call RenameFile()<cr>

function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

" -- project navigation
"  - SPC-a -> alternate files
"  - SPC-e -> edit files
nnoremap <Leader>aa :A<CR>
nnoremap <Leader>as :AS<CR>
nnoremap <Leader>av :AV<CR>
nnoremap <Leader>at :AT<CR>
" rails/phoenix
nnoremap <Leader>ec :Econtroller<Space>
nnoremap <Leader>em :Emodel<Space>
nnoremap <Leader>ev :Eview<Space>
nnoremap <Leader>et :Etest<Space>

" -- Location list SPC-l
nnoremap <Leader>lo :lopen<CR>
nnoremap <Leader>lc :lcl<CR>

" -- Quickfix list SPC-c
nnoremap <Leader>co :Copen<CR>
nnoremap <Leader>cl :ccl<CR>

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

  noremap <Leader>/s :Grepper! -noswitch -tool ag -query '\b<C-r><C-w>\b'<CR>
  nnoremap <Leader>// :Grepper! -tool ag -query ''<Left>
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
nnoremap <Leader>ot :15sp<CR>:terminal<CR>

" <TAB>: completion
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

nnoremap <Leader>d :Dispatch<Space>

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
  if fugitive#head() != ''
    return fugitive#statusline()
  else
    return ''
  endif
endfunction

function! S_noemake()
  if neomake#statusline#LoclistStatus() != ''
    return ' ' . neomake#statusline#LoclistStatus(' neomake: ')
  else
    return ''
  endif
endfunction

set statusline=                                                            " clear upon load
set statusline+=%1*
set statusline+=\ %{emoji#available()?emoji#for('sparkles').'\ ':''}       " sparkles
set statusline+=\ %n:\ %f                                                  " buffer + filename
set statusline+=%{S_modified()}                                            " modification
set statusline+=%3*
set statusline+=%{strlen(&filetype)?'\ ['.&filetype.']\ ':''}              " file info
set statusline+=%4*
set statusline+=%{S_fugitive()}                                   " git
set statusline+=%2*
set statusline+=%{S_noemake()}
set statusline+=%1*
set statusline+=%=%-30.(line:\ %l\ of\ %L,\ col:\ %c%V%)                   " position
set statusline+=%3*
set statusline+=\ %P\                                                      " percent
set statusline+=\ %{emoji#available()?emoji#for('sparkles').'\ ':''}       " sparkles

highlight User1 ctermfg=110 ctermbg=236 guifg=#83a598 guibg=#282828
highlight User2 ctermfg=203 ctermbg=236 guibg=#282828 guifg=#fb4934
highlight User3 ctermfg=213 ctermbg=236 guibg=#282828 guifg=#d3869b

highlight SignColumn ctermbg=black
highlight lineNr ctermbg=black
highlight GitGutterAdd ctermbg=black ctermfg=142
highlight GitGutterChange ctermbg=black ctermfg=109
highlight GitGutterDelete ctermbg=black ctermfg=167

" -- Local vimrc
if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif
