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
nnoremap <Leader>wco :Copen<CR>
nnoremap <Leader>wcl :ccl<CR>

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
" --- goto SPC-mg
nnoremap <Leader>mga :A<CR>
" --- repl SPC-md
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
let test#strategy = "dispatch"
let test#ruby#rspec#options = '--format progress'
nmap <silent> <leader>mtt :TestFile<CR>
nmap <silent> <leader>mtn :TestNearest<CR>
nmap <silent> <leader>mta :TestSuite<CR>
nmap <silent> <leader>mtl :TestLast<CR>
nmap <silent> <leader>mtv :TestVisit<CR>

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

  noremap <Leader>/s :Grepper! -noswitch -tool ag -query '\b<C-r><C-w>\b'<CR>
  nnoremap <Leader>// :Grepper! -tool ag -query ''<Left>
  command! -nargs=* Ag Grepper -tool ag -query <args>
  command! Grep Grepper! -tool ag
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

source ~/dotfiles/vim/appearance.vim
" -- Local vimrc
if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif

function! M_fzf_proj(type) abort
  let projections = projectionist#navigation_commands()
  if projections != {}
    if has_key(projections, a:type)
      let subset =  projections[a:type]
      let cwd = getcwd()
      for pair in subset
        if cwd =~ pair[0]
          let str = fnamemodify(pair[1], ":p:h")
          exe 'FZF ' . str
          return
        endif
      endfor
      echo 'no projections of that type were found in this project'
    else
      echo 'no projections of that type were found'
    endif
  else
    echo 'no projections found'
  endif
endfunction

function! M_load_projections() abort
  let projections = projectionist#navigation_commands()
  if projections != {}
    for [type, stuff] in items(projections)
      execute 'command! '
            \ 'FZF' . type
            \ " call M_fzf_proj('" . type ."')"
    endfor
  endif
endfunction

augroup fzf_projections
  autocmd!
  autocmd User ProjectionistActivate call M_load_projections()
augroup END
