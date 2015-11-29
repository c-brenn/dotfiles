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
Plug 'thoughtbot/vim-rspec'
Plug 'c-brenn/mix-test.vim'
Plug 'tpope/vim-dispatch'

" -- COMPLETION --
Plug 'ajh17/VimCompletesMe'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" -- MOVING THINGS --
Plug 'AndrewRadev/splitjoin.vim'

" -- MAGICAL SEARCH --
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install'  }

" -- SYNTAX --
Plug 'benekastah/neomake'
Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'
Plug 'cakebaker/scss-syntax.vim'
Plug 'vim-scripts/haskell.vim'
Plug 'elixir-lang/vim-elixir'
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
Plug 'godlygeek/tabular'
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
map <Leader>sp :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
map <Leader>vp :vsp <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
map <Leader>tn :tabnew<CR>
map <Leader>tc :tabclose<CR>
map <Leader>bd :bd<CR>
map <Leader>rs :vsp <C-r>#<cr><C-w>w

" Errors
autocmd! BufWritePost * Neomake
let g:neomake_open_list = 2

map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

nnoremap <leader>R :so ~/.config/nvim/init.vim<CR>

nnoremap <silent> <C-p> :FZF<CR>

nnoremap <Leader>tw :call TrimWhitespace()<CR>
au BufWritePre *.rb :call TrimWhitespace()

cnoremap <expr> %% expand('%:h').'/'

command! Q q
command! Qall qall
command! QA qall
command! E e


" ---------------------------
"  Tests
"  --------------------------
let g:rspec_command = "Dispatch bundle exec rspec {spec}"
let g:mix_test_command = "Dispatch mix test {test}"
map <Leader>tt :call TestCurrentFile()<CR>
map <Leader>ts :call TestNearest()<CR>
map <Leader>ta :call TestAll()<CR>
map <Leader>tl :call TestLast()<CR>

function! TestCurrentFile()
  if InMixTestFile()
    call MixRunCurrentTestFile()
  else
    call RunCurrentSpecFile()
  endif
endfunction

function! TestNearest()
  if InMixTestFile()
    call MixRunCurrentTest()
  else
    call RunNearestSpec()
  endif
endfunction

function! TestAll()
  if InMixProject()
    call MixRunAllTests()
  else
    call RunAllSpecs()
  endif
endfunction

function! TestLast()
  if InMixProject()
    call MixRunLastTest()
  else
    call RunLastSpec()
  endif
endfunction

map <Leader>d :Dispatch<CR>
autocmd FileType elixir let b:dispatch = 'mix test %'

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
silent! if emoji#available()
  let s:ft_emoji = map({
    \ 'c':          'baby_chick',
    \ 'coffee':     'coffee',
    \ 'cpp':        'chicken',
    \ 'css':        'art',
    \ 'eruby':      'ring',
    \ 'gitcommit':  'soon',
    \ 'haml':       'hammer',
    \ 'help':       'angel',
    \ 'html':       'herb',
    \ 'java':       'older_man',
    \ 'javascript': 'monkey',
    \ 'make':       'seedling',
    \ 'markdown':   'book',
    \ 'python':     'snake',
    \ 'ruby':       'gem',
    \ 'sh':         'shell',
    \ 'text':       'books',
    \ 'vim':        'poop',
    \ 'vim-plug':   'electric_plug',
    \ 'yaml':       'yum',
  \ }, 'emoji#for(v:val)')

  function! S_filetype()
    if empty(&filetype)
      return emoji#for('grey_question')
    else
      return get(s:ft_emoji, &filetype, '['.&filetype.']')
    endif
  endfunction

  function! S_modified()
    if &modified
      return emoji#for('kiss').' '
    elseif !&modifiable
      return emoji#for('construction').' '
    else
      return ''
    endif
  endfunction

  function! S_fugitive()
    if !exists('g:loaded_fugitive')
      return ''
    endif
    let head = fugitive#head()
    if empty(head)
      return ''
    else
      return head == 'master' ? emoji#for('crown') : emoji#for('dango').'='.head
    endif
  endfunction

  let s:braille = split('"⠉⠒⠤⣀', '\zs')
  function! Braille()
    let len = len(s:braille)
    let [cur, max] = [line('.'), line('$')]
    let pos  = min([len * (cur - 1) / max([1, max - 1]), len - 1])
    return s:braille[pos]
  endfunction

  hi def link User1 TablineFill
  let s:woman = emoji#for('older_woman')
  function! MyStatusLine()
    let mod = '%{S_modified()}'
    let ro  = "%{&readonly ? emoji#for('lock') . ' ' : ''}"
    let ft  = '%{S_filetype()}'
    let fug = ' %{S_fugitive()}'
    let sep = ' %= '
    let pos = ' %l,%c%V '
    let pct = ' %P '

    return s:woman.' [%n] %F %<'.mod.ro.ft.fug.sep.pos.'%{Braille()}%*'.pct.s:woman
  endfunction

  set statusline=%!MyStatusLine()
endif

" -----------------------
" LOCAL VIMRC
" -----------------------

if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif
